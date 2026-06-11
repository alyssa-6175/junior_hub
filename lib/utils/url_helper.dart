import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openUrl(BuildContext context, String url) async {
  final fullUrl = url.startsWith('http') ? url : 'https://$url';
  final uri = Uri.parse(fullUrl);

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not open: $url'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
}
