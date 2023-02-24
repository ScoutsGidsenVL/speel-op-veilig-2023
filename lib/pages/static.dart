import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speel_op_veilig/model/dynamic_data.dart';
import 'package:speel_op_veilig/util.dart';

class Static extends StatelessWidget {
  const Static({super.key, required this.path, required this.title});

  final String path;
  final String title;

  @override
  Widget build(BuildContext context) {
    var body = context.watch<DynamicData>().text[path];
    return Scaffold(
        appBar: AppBar(title: Text(title.toUpperCase())),
        body: Markdown(
            data: body ?? '',
            styleSheet: markdownStyle(context),
            onTapLink: linkHandler(context)));
  }
}
