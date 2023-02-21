import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Vragen extends StatefulWidget {
  const Vragen({Key? key}) : super(key: key);

  @override
  VragenState createState() => VragenState();
}

class VragenState extends State<Vragen> {
  @override
  initState() {
    super.initState();
    rootBundle.loadString('assets/data.json').then((source) async {
      final data = await json.decode(source);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Vraag en Antwoord')),
        body: null // TODO
        );
  }
}
