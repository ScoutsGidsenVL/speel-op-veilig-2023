import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speel_op_veilig/model/chapters.dart';
import 'package:speel_op_veilig/widgets/custom_icon.dart';
import 'package:speel_op_veilig/widgets/faq.dart';
import 'package:speel_op_veilig/widgets/section.dart';

class Vragen extends StatefulWidget {
  const Vragen({Key? key}) : super(key: key);

  @override
  VragenState createState() => VragenState();
}

class VragenState extends State<Vragen> {
  List<Questions> _chapters = [];
  List<String>? _filter;

  @override
  initState() {
    super.initState();
    rootBundle.loadString('assets/data.json').then((source) async {
      final data = await json.decode(source);
      setState(() {
        _chapters = Chapters.fromJson(data)
            .chapters
            .expand((c) => c.subchapters
                .where((s) => s.questions != null)
                .map((s) => s.questions!))
            .toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('VRAAG EN ANTWOORD')),
        body: ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: _chapters.length,
            itemBuilder: (context, index) {
              return Section(
                title: Row(children: [
                  CustomIcon(type: _chapters[index].icon, size: 20),
                  Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(_chapters[index].title.toUpperCase(),
                          style: Theme.of(context).textTheme.headlineLarge)),
                ]),
                children: _chapters[index]
                        .content
                        ?.map((e) => Faq(
                            question: e.question,
                            answers: Map.fromEntries(e.answers
                                .map((a) => MapEntry(a.group, a.answer)))))
                        .toList() ??
                    [],
              );
            }));
  }
}
