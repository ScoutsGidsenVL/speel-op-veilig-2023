import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  static const titleStyle = TextStyle(fontSize: 20);

  final String title;
  final List<Widget> children;

  const Section({Key? key, required this.title, this.children = const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(title, style: titleStyle), ...children],
        ));
  }
}
