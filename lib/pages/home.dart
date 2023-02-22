import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speel_op_veilig/model/chapters.dart';
import 'package:speel_op_veilig/widgets/custom_icon.dart';
import 'package:speel_op_veilig/widgets/section.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  List<Chapter> _chapters = [];
  final _infoPages = {
    '/veilige-activiteit': 'Veilige activiteit',
    '/verzekeringen': 'Verzekeringen en aansprakelijkheid',
    '/crisis': 'Crisis en noodsituaties',
    '/vragen-en-antwoorden': 'Vragen en Antwoorden',
    '/wegwijs': 'Wegwijs',
  }.entries.toList();

  @override
  initState() {
    super.initState();
    rootBundle.loadString('assets/data.json').then((source) async {
      final data = await json.decode(source);
      setState(() {
        _chapters = Chapters.fromJson(data).chapters;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SPEEL OP VEILIG'), actions: [
        IconButton(
            onPressed: () => Navigator.of(context).pushNamed('/wegwijs'),
            icon: const Icon(Icons.help_outline))
      ]),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Section(
            title: Text('Thema\'s',
                style: Theme.of(context).textTheme.headlineLarge),
            children: _chapters
                .map((c) => TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, '/${c.url}'),
                      child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(children: [
                            CustomIcon(type: c.url, size: 16),
                            Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Text(c.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium)),
                          ])),
                    ))
                .toList(),
          ),
          Section(
            title: Text('Bijkomende info',
                style: Theme.of(context).textTheme.headlineLarge),
            children: _infoPages
                .map((i) => TextButton(
                      onPressed: () => Navigator.pushNamed(context, i.key),
                      child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(children: [
                            Text(i.value,
                                style: Theme.of(context).textTheme.bodyMedium)
                          ])),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
