import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:speelopveilig/model/dynamic_data.dart';
import 'package:speelopveilig/widgets/custom_icon.dart';

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
    final dynamicData = context.watch<DynamicData>();

    return Scaffold(
      appBar: AppBar(title: const Text('SPEEL OP VEILIG'), actions: [
        IconButton(
            onPressed: () => Navigator.of(context).pushNamed('/wegwijs'),
            icon: const Icon(Icons.help_outline))
      ]),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Thema\'s',
                      style: Theme.of(context).textTheme.headlineLarge),
                  ...(dynamicData.chapters ?? [])
                      .map((c) => TextButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, '/${c.url}'),
                            child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(children: [
                                  Padding(
                                      padding: const EdgeInsets.only(right: 4),
                                      child: CustomIcon(type: c.url, size: 16)),
                                  Text(c.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                ])),
                          ))
                      .toList(),
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Bijkomende info',
                        style: Theme.of(context).textTheme.headlineLarge),
                    ..._infoPages
                        .map((i) => TextButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, i.key),
                              child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Row(children: [
                                    Text(i.value,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium)
                                  ])),
                            ))
                        .toList()
                  ])),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Text(
                'Speel op Veilig v${dynamicData.packageInfo?.version ?? ''}',
                style: const TextStyle(fontSize: 16, color: Colors.grey)),
          )
        ],
      )),
    );
  }
}
