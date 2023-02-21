import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Verzekeringen extends StatefulWidget {
  const Verzekeringen({Key? key}) : super(key: key);

  @override
  VerzekeringenState createState() => VerzekeringenState();
}

class VerzekeringenState extends State<Verzekeringen> {
  String _body = '';

  @override
  initState() {
    super.initState();
    rootBundle
        .loadString('assets/content/verzekeringen.md')
        .then((source) => setState(() => _body = source));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Verzekeringen en aansprakelijkheid')),
        body: Markdown(data: _body));
  }
}
