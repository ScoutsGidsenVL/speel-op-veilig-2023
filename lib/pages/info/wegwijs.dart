import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Wegwijs extends StatefulWidget {
  const Wegwijs({Key? key}) : super(key: key);

  @override
  WegwijsState createState() => WegwijsState();
}

class WegwijsState extends State<Wegwijs> {
  String _body = '';

  @override
  initState() {
    super.initState();
    rootBundle
        .loadString('assets/content/wegwijs.md')
        .then((source) => setState(() => _body = source));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Wegwijs in deze app')),
        body: Markdown(data: _body));
  }
}
