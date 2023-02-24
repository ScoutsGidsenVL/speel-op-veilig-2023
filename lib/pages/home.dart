import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speel_op_veilig/model/dynamic_data.dart';
import 'package:speel_op_veilig/widgets/custom_icon.dart';
import 'package:speel_op_veilig/widgets/section.dart';

class Home extends StatelessWidget {
  final _infoPages = {
    '/veilige-activiteit': 'Veilige activiteit',
    '/verzekeringen': 'Verzekeringen en aansprakelijkheid',
    '/crisis': 'Crisis en noodsituaties',
    '/vragen-en-antwoorden': 'Vragen en Antwoorden',
    '/wegwijs': 'Wegwijs',
  }.entries.toList();

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SPEEL OP VEILIG'), actions: [
        IconButton(
            onPressed: () => Navigator.of(context).pushNamed('/wegwijs'),
            icon: const Icon(Icons.help_outline))
      ]),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Section(
            title: Text('Thema\'s',
                style: Theme.of(context).textTheme.headlineLarge),
            children: (context.watch<DynamicData>().chapters ?? [])
                .map((c) => TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, '/${c.url}'),
                      child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(children: [
                            CustomIcon(type: c.url, size: 16),
                            Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Text(c.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium)),
                          ])),
                    ))
                .toList(),
          ),
          Section(
            title: Text('Bijkomende info',
                style: Theme.of(context).textTheme.headlineLarge),
            children: _infoPages
                .map((i) => TextButton(
                      onPressed: () => Navigator.pushNamed(context, i.key),
                      child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(children: [
                            Text(i.value,
                                style: Theme.of(context).textTheme.bodyMedium)
                          ])),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
