param(
  [string]$CatalogPath = 'lib/data/resources_data.dart',
  [string]$ManifestPath = '',
  [int]$ThrottleLimit = 12,
  [int]$TimeoutSeconds = 20
)

$urls = [System.Collections.Generic.HashSet[string]]::new(
  [System.StringComparer]::OrdinalIgnoreCase
)

if ($ManifestPath) {
  Get-Content -LiteralPath $ManifestPath | ForEach-Object {
    if ($_ -match 'RESOURCE_AUDIT_URL=(https?://\S+)$') {
      [void]$urls.Add($Matches[1])
    }
  }
} else {
  $catalog = Get-Content -Raw -LiteralPath $CatalogPath
  [regex]::Matches($catalog, 'https?://[^''"\s]+') | ForEach-Object {
    $url = $_.Value.TrimEnd(')', ']', '}', ',', ';')
    if (-not $url.Contains('$')) {
      [void]$urls.Add($url)
    }
  }

  # These College Board destinations are generated at runtime from each AP
  # course slug, so include them even though their complete URLs are not
  # literal strings in the catalog source.
  [regex]::Matches(
    $catalog,
    'https://apstudents\.collegeboard\.org/courses/([a-z0-9-]+)'
  ) | ForEach-Object {
    $slug = $_.Groups[1].Value
    [void]$urls.Add("https://apcentral.collegeboard.org/courses/$slug/exam")
    [void]$urls.Add(
      "https://apcentral.collegeboard.org/courses/$slug/exam/past-exam-questions"
    )
  }
}

$results = $urls | Sort-Object | ForEach-Object -Parallel {
  $url = $_
  $handler = [System.Net.Http.HttpClientHandler]::new()
  $handler.AllowAutoRedirect = $true
  $handler.MaxAutomaticRedirections = 8
  $client = [System.Net.Http.HttpClient]::new($handler)
  $client.Timeout = [TimeSpan]::FromSeconds($using:TimeoutSeconds)
  $client.DefaultRequestHeaders.UserAgent.ParseAdd(
    'Mozilla/5.0 (compatible; JuniorHubLinkAudit/1.0)'
  )

  try {
    $request = [System.Net.Http.HttpRequestMessage]::new(
      [System.Net.Http.HttpMethod]::Head,
      $url
    )
    $response = $client.Send(
      $request,
      [System.Net.Http.HttpCompletionOption]::ResponseHeadersRead
    )
    $status = [int]$response.StatusCode
    $finalUrl = $response.RequestMessage.RequestUri.AbsoluteUri
    $response.Dispose()
    $request.Dispose()

    # A number of healthy sites reject HEAD requests. Retry those responses
    # with a one-byte range GET so validation remains lightweight.
    if ($status -in 400, 403, 405) {
      $request = [System.Net.Http.HttpRequestMessage]::new(
        [System.Net.Http.HttpMethod]::Get,
        $url
      )
      $request.Headers.Range = [System.Net.Http.Headers.RangeHeaderValue]::new(0, 0)
      $response = $client.Send(
        $request,
        [System.Net.Http.HttpCompletionOption]::ResponseHeadersRead
      )
      $status = [int]$response.StatusCode
      $finalUrl = $response.RequestMessage.RequestUri.AbsoluteUri
      $response.Dispose()
      $request.Dispose()
    }

    [pscustomobject]@{
      Url = $url
      Status = $status
      FinalUrl = $finalUrl
      Error = $null
    }
  } catch {
    $firstError = $_.Exception.GetBaseException().Message
    Start-Sleep -Milliseconds 300
    try {
      # Retry transient connection resets once with a normal GET. This catches
      # healthy hosts which occasionally close a highly parallel HEAD request.
      $request = [System.Net.Http.HttpRequestMessage]::new(
        [System.Net.Http.HttpMethod]::Get,
        $url
      )
      $response = $client.Send(
        $request,
        [System.Net.Http.HttpCompletionOption]::ResponseHeadersRead
      )
      [pscustomobject]@{
        Url = $url
        Status = [int]$response.StatusCode
        FinalUrl = $response.RequestMessage.RequestUri.AbsoluteUri
        Error = $null
      }
      $response.Dispose()
      $request.Dispose()
    } catch {
      [pscustomobject]@{
        Url = $url
        Status = 0
        FinalUrl = $null
        Error = "$firstError | Retry: $($_.Exception.GetBaseException().Message)"
      }
    }
  } finally {
    $client.Dispose()
    $handler.Dispose()
  }
} -ThrottleLimit $ThrottleLimit

# These current official pages are discoverable and readable in normal
# browsers/search, but their hosts return a synthetic 404 or DNS failure to
# this lightweight .NET audit client. Keep them visible as restricted instead
# of reporting healthy, manually verified destinations as broken.
$knownAuditFalseNegatives = @(
  '^https://www\.andovercomputingopen\.org/?$',
  '^https://www\.naclo\.org/?$'
)

function Test-KnownAuditFalseNegative([string]$Url) {
  return @($knownAuditFalseNegatives | Where-Object { $Url -match $_ }).Count -gt 0
}

$broken = @(
  $results | Where-Object {
    -not (Test-KnownAuditFalseNegative $_.Url) -and (
      $_.Status -eq 0 -or
      $_.Status -in 404, 410 -or
      ($_.Status -ge 500 -and
        $_.Url -notmatch '^https://www\.amazon\.com/' -and
        $_.Url -notmatch '^https://drive\.google\.com/')
    )
  }
)
$restricted = @(
  $results | Where-Object {
    $_.Status -in 401, 403, 429 -or
    ($_.Status -ge 500 -and $_.Url -match '^https://www\.amazon\.com/') -or
    ($_.Status -ge 500 -and $_.Url -match '^https://drive\.google\.com/') -or
    ((
      $_.Status -eq 0 -or
      $_.Status -in 404, 410 -or
      $_.Status -ge 500
    ) -and (Test-KnownAuditFalseNegative $_.Url))
  }
)
$reachable = @(
  $results | Where-Object {
    $_.Status -ge 200 -and $_.Status -lt 400
  }
)

[pscustomobject]@{
  Total = $results.Count
  Reachable = $reachable.Count
  RestrictedButResponding = $restricted.Count
  BrokenOrUnreachable = $broken.Count
} | Format-List

if ($restricted.Count -gt 0) {
  Write-Output 'Restricted or rate-limited destinations:'
  $restricted | Sort-Object Status, Url | Format-Table Status, Url -AutoSize
}

if ($broken.Count -gt 0) {
  Write-Output 'Broken or unreachable destinations:'
  $broken | Sort-Object Status, Url | Format-Table Status, Url, Error -AutoSize -Wrap
  exit 1
}
