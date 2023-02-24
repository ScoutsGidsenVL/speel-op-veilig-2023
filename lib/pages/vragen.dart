import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:speel_op_veilig/model/chapters.dart';
import 'package:speel_op_veilig/util.dart';
import 'package:speel_op_veilig/widgets/custom_icon.dart';
import 'package:speel_op_veilig/widgets/faq.dart';
import 'package:speel_op_veilig/widgets/section.dart';
import 'package:expandable/expandable.dart';

class Vragen extends StatefulWidget {
  const Vragen({Key? key}) : super(key: key);

  @override
  VragenState createState() => VragenState();
}

class VragenState extends State<Vragen> {
  List<Questions> _chapters = [];
  final List<String> _filter = [];

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

  setFilter(String key, bool enabled) {
    setState(() {
      if (_filter.contains(key)) {
        _filter.remove(key);
      } else {
        _filter.add(key);
      }
    });
  }

  bool filterAnswer(Answer a) {
    return _filter.isEmpty || _filter.contains(a.group);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('VRAAG EN ANTWOORD')),
        body: ListView(padding: const EdgeInsets.all(20), children: [
          Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ExpandablePanel(
                  theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center),
                  header: Text('Filter op tak',
                      style: Theme.of(context).textTheme.headlineSmall),
                  collapsed: Container(),
                  expanded: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: Faq.groups.entries
                        .map((g) => CheckboxListTile(
                            title: Text(g.value,
                                style: Theme.of(context).textTheme.bodySmall),
                            dense: true,
                            contentPadding: const EdgeInsets.all(0),
                            visualDensity: const VisualDensity(vertical: -2),
                            value: _filter.contains(g.key),
                            onChanged: (enabled) =>
                                setFilter(g.key, enabled ?? false)))
                        .toList(),
                  ))),
          ..._chapters
              .where((c) =>
                  c.content?.any((e) => e.answers.any(filterAnswer)) ?? false)
              .map((c) => Section(
                      title: Row(children: [
                        CustomIcon(type: c.icon, size: 20),
                        Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Text(c.title.toUpperCase(),
                                style:
                                    Theme.of(context).textTheme.headlineLarge)),
                      ]),
                      children: [
                        ...c.content
                                ?.where((e) => e.answers.any((a) =>
                                    _filter.isEmpty ||
                                    _filter.contains(a.group)))
                                .map((e) => Faq(
                                    question: e.question,
                                    answers: Map.fromEntries(e.answers
                                        .where(filterAnswer)
                                        .map((a) =>
                                            MapEntry(a.group, a.answer)))))
                                .toList() ??
                            [],
                        c.url == null
                            ? Container()
                            : MarkdownBody(
                                data:
                                    '[Meer weten over ${c.title.toLowerCase()}...](/${c.url})',
                                styleSheet: markdownStyle(context),
                                onTapLink: linkHandler(context)),
                      ])),
        ]));
  }
}
