import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:speel_op_veilig/model/chapters.dart';
import 'package:speel_op_veilig/widgets/rule_item.dart';

class Rules extends StatelessWidget {
  final String type;
  final String title;
  final List<Item> rules;

  const Rules(
      {Key? key, required this.type, required this.title, required this.rules})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.headlineMedium),
            ...rules
                .map((rule) => rule.item != null
                    ? RuleItem(text: rule.item, why: rule.why)
                    : rule.items != null
                        ? Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MarkdownBody(
                                      data: rule.title ?? '',
                                      styleSheet: MarkdownStyleSheet(
                                          p: Theme.of(context)
                                              .textTheme
                                              .headlineSmall)),
                                  ...rule.items!.map((e) =>
                                      RuleItem(text: e.item, why: e.why)),
                                ]))
                        : Container())
                .toList()
          ],
        ));
  }
}
