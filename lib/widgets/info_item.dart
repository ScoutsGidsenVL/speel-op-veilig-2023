import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:speel_op_veilig/util.dart';
import 'package:speel_op_veilig/widgets/custom_icon.dart';

class InfoItem extends StatelessWidget {
  final String type;
  final String text;

  const InfoItem({Key? key, required this.type, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: const EdgeInsets.only(top: 4, right: 2),
              child: CustomIcon(type: type)),
          Flexible(
              fit: FlexFit.tight,
              child: MarkdownBody(
                  data: text,
                  styleSheet: markdownStyle(context),
                  onTapLink: linkHandler(context)))
        ]));
  }
}
