import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speel_op_veilig/util.dart';

class Crisis extends StatefulWidget {
  const Crisis({Key? key}) : super(key: key);

  @override
  CrisisState createState() => CrisisState();
}

class CrisisState extends State<Crisis> {
  String _body = '';

  @override
  initState() {
    super.initState();
    rootBundle
        .loadString('assets/content/crisis.md')
        .then((source) => setState(() => _body = source));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('CRISIS- EN NOODSITUATIES')),
        body: Markdown(
            data: _body,
            styleSheet: markdownStyle(context),
            onTapLink: linkHandler(context)));
  }
}
