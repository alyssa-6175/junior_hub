# Firestore activity tracking review

Reviewed application Firestore paths and operations:

- `users/{uid}`: user-owned study settings. Existing app reads and merges this document.
- `users/{uid}/resourceActivity/{resourceId}`: user-owned resource-open counters and timestamps.
- `dailyActivity/{day}_{uid}`: proposed one-document-per-user-per-local-day activity summary for the administrator dashboard.

The dashboard will list `users` by `lastActiveAt` and filter `dailyActivity` by `day`. It will sort query results in the client to avoid a composite index.

New identity and activity fields are private to the owner and verified administrators: `email`, `displayName`, `lastActiveAt`, `lastAction`, and `lastActionAt`. The client must derive email and display name from Firebase Auth and security rules must validate the email against the authenticated token. The app never stores or authorizes an admin role in Firestore; the existing verified-email plus custom-claim check remains the authority.

Limits: activity summaries are engagement indicators, not immutable audit logs. The client can only write its own records, but an authenticated user could still create their own activity record at an arbitrary local day. An audit-grade source of truth would require a trusted server or Cloud Function.

## Rule review

- Public list/read: denied. Every path requires authentication, ownership, or the existing verified custom admin claim.
- Cross-user reads and writes: denied. User and resource-activity paths require a matching Auth UID. Daily records require the data UID, email, and document ID to match the current Auth user.
- Privilege escalation: denied. No role field exists in Firestore. Administrator access depends on either a verified, bootstrapped owner email (`apan@eastsideprep.org` or `alyssa.pannn@gmail.com`) or an Admin SDK-issued custom claim plus verified Eastside Prep email.
- Schema/type/size bypass: denied for the new fields. User documents have an allowlist, email is checked against the Auth token, action labels are an allowlist, timestamps must be server timestamps, and strings are bounded. Existing preference arrays retain their existing size limits.
- Counter replay: resource-open counters may only move up by exactly one and may not exceed 10,000. Opening a resource repeatedly is still a legitimate user action, so this is not treated as a unique-event counter.
- Daily date integrity: limited by client-only architecture. The document ID, UID, and email are scoped to the caller and timestamps are server-authenticated, but the local day string can be chosen by that caller. The dashboard therefore labels this as engagement tracking rather than an audit log.
