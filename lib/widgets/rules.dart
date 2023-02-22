import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:speel_op_veilig/model/chapters.dart';
import 'package:speel_op_veilig/util.dart';
import 'package:speel_op_veilig/widgets/custom_icon.dart';
import 'package:speel_op_veilig/widgets/rule_item.dart';

class Rules extends StatelessWidget {
  final String type;
  final String? description;
  final String title;
  final List<Item> rules;

  const Rules(
      {Key? key,
      required this.type,
      required this.description,
      required this.title,
      required this.rules})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: CustomIcon.types[type]?.color)),
            description == null ? Container() : Text(description!),
            ...rules
                .map((rule) => rule.item != null
                    ? RuleItem(text: rule.item, why: rule.why, type: type)
                    : rule.title != null
                        ? Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MarkdownBody(
                                      data: rule.title ?? '',
                                      styleSheet: markdownStyle(context)
                                          .copyWith(
                                              p: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall),
                                      onTapLink: linkHandler(context)),
                                  ...rule.items?.map((e) => RuleItem(
                                          text: e.item,
                                          why: e.why,
                                          type: type)) ??
                                      [],
                                ]))
                        : Container())
                .toList()
          ],
        ));
  }
}
