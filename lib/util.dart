import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

MarkdownStyleSheet markdownStyle(BuildContext context) {
  return MarkdownStyleSheet(
      p: const TextStyle(fontSize: 12),
      a: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          decoration: TextDecoration.underline),
      h2: TextStyle(
          fontSize: 20, color: Theme.of(context).colorScheme.secondary));
}
