import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speel_op_veilig/model/chapters.dart';
import 'package:speel_op_veilig/widgets/rules.dart';

class Thema extends StatefulWidget {
  const Thema({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  ThemaState createState() => ThemaState();
}

class ThemaState extends State<Thema> {
  Chapter? _chapter;

  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 200))
        .then((_) => rootBundle.loadString('assets/data.json'))
        .then((source) async {
      final data = await json.decode(source);
      setState(() {
        _chapter = Chapters.fromJson(data)
            .chapters
            .firstWhere((c) => c.url == widget.name);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_chapter?.title.toUpperCase() ?? '')),
      body: _chapter == null
          ? null
          : ListView(
              padding: const EdgeInsets.all(20),
              children: _chapter!.subchapters
                  .where((s) => s.content?.isNotEmpty ?? false)
                  .map((s) => Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            s.title?.isEmpty ?? false
                                ? Container()
                                : Text(s.title?.toUpperCase() ?? '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge),
                            s.description == null
                                ? Container()
                                : Text(s.description!),
                            ...s.content
                                    ?.map((i) => Rules(
                                        type: i.type,
                                        title: i.title,
                                        description: i.description,
                                        rules: i.list ?? []))
                                    .toList() ??
                                []
                          ])))
                  .toList(),
            ),
    );
  }
}
