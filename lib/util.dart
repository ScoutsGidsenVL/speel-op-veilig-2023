import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

MarkdownStyleSheet markdownStyle(BuildContext context) {
  return MarkdownStyleSheet(
      p: const TextStyle(fontSize: 18),
      a: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          decoration: TextDecoration.underline),
      h2: TextStyle(
          fontSize: 24, color: Theme.of(context).colorScheme.secondary),
      h2Padding: const EdgeInsets.only(top: 8));
}

void Function(String, String?, String) linkHandler(BuildContext context) {
  return (String text, String? url, String title) {
    if (url == null) {
      return;
    }
    if (url.startsWith("http://") ||
        url.startsWith("https://") ||
        url.startsWith("tel:") ||
        url.startsWith("mailto:")) {
      launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else if (url.startsWith("/")) {
      Navigator.of(context).pushNamed(url);
    }
  };
}
