import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:speel_op_veilig/util.dart';
import 'package:speel_op_veilig/widgets/custom_icon.dart';

class RuleItem extends StatelessWidget {
  final String? text;
  final String? why;
  final String? type;

  const RuleItem(
      {Key? key, required this.text, required this.why, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          type == null
              ? Container()
              : Padding(
                  padding: const EdgeInsets.only(top: 4, right: 2),
                  child: CustomIcon(type: type!, color: true)),
          Flexible(
              fit: FlexFit.tight,
              child: MarkdownBody(
                  data: text ?? '', onTapLink: linkHandler(context))),
          why == null || why!.isEmpty
              ? Container()
              : IconButton(
                  onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) => SimpleDialog(
                            title: Text('Waarom?',
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                            contentPadding: const EdgeInsets.only(
                                top: 10, right: 25, bottom: 25, left: 25),
                            children: [Text(why!)],
                          )),
                  icon: const Icon(Icons.question_mark),
                  iconSize: 16,
                  splashRadius: 24)
        ]));
  }
}
