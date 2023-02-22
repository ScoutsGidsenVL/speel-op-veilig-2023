import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speel_op_veilig/util.dart';

class Static extends StatefulWidget {
  const Static({Key? key, required this.path, required this.title})
      : super(key: key);

  final String path;
  final String title;

  @override
  StaticState createState() => StaticState();
}

class StaticState extends State<Static> {
  String _body = '';

  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 200))
        .then((_) => rootBundle.loadString('assets/content/${widget.path}.md'))
        .then((source) => setState(() => _body = source));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title.toUpperCase())),
        body: Markdown(
            data: _body,
            styleSheet: markdownStyle(context),
            onTapLink: linkHandler(context)));
  }
}
