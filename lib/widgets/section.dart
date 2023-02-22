import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final Widget title;
  final List<Widget> children;

  const Section({Key? key, required this.title, this.children = const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: const EdgeInsets.only(bottom: 10), child: title),
            ...children
          ],
        ));
  }
}
