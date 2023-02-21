import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VeiligeActiviteit extends StatefulWidget {
  const VeiligeActiviteit({Key? key}) : super(key: key);

  @override
  VeiligeActiviteitState createState() => VeiligeActiviteitState();
}

class VeiligeActiviteitState extends State<VeiligeActiviteit> {
  String _body = '';

  @override
  initState() {
    super.initState();
    rootBundle
        .loadString('assets/content/veilige_activiteit.md')
        .then((source) => setState(() => _body = source));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Een veilige activiteit')),
        body: Markdown(data: _body));
  }
}