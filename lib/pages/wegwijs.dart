import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speel_op_veilig/model/dynamic_data.dart';
import 'package:speel_op_veilig/util.dart';
import 'package:speel_op_veilig/widgets/custom_icon.dart';

class Wegwijs extends StatelessWidget {
  const Wegwijs({super.key, required this.path, required this.title});

  final String path;
  final String title;

  final _headers = const {
    "Wet": 'wet',
    "Regels": 'regel',
    "Richtlijnen": 'richtlijn',
    "Suggesties": 'suggestie',
  };

  @override
  Widget build(BuildContext context) {
    var body = context.watch<DynamicData>().text[path] ?? '';
    var parts = body.replaceAll("\r\n", "\n").split("\n\n## ");
    return Scaffold(
        appBar: AppBar(title: Text(title.toUpperCase())),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: parts.asMap().entries.map((p) {
            var i = p.value.indexOf("\n");
            var header = i > 1 ? p.value.substring(0, i) : '';
            var icon = _headers[header];
            return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      icon == null
                          ? Container()
                          : Row(
                              children: [
                                CustomIcon(type: icon, size: 20),
                                Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: Text(p.value.substring(0, i),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium
                                            ?.copyWith(
                                                color: CustomIcon
                                                    .types[icon]?.color))),
                              ],
                            ),
                      MarkdownBody(
                          data: icon == null
                              ? (p.key > 0 ? '## ' : '') + p.value
                              : p.value.substring(i),
                          styleSheet: markdownStyle(context),
                          onTapLink: linkHandler(context))
                    ]));
          }).toList(),
        ));
  }
}
