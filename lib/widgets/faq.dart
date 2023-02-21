import 'package:flutter/material.dart';

class Faq extends StatelessWidget {
  static const questionStyle = TextStyle(fontSize: 16);

  final String question;
  final Map<String, String> answers;

  const Faq({Key? key, required this.question, required this.answers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(question, style: Theme.of(context).textTheme.headlineMedium),
            ...answers.entries
                .map((answer) => Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(answer.key,
                            style: Theme.of(context).textTheme.bodySmall),
                        Text(answer.value,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontStyle: FontStyle.italic))
                      ],
                    )))
                .toList()
          ],
        ));
  }
}
