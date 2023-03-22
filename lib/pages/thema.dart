import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speelopveilig/model/dynamic_data.dart';
import 'package:speelopveilig/widgets/info_item.dart';
import 'package:speelopveilig/widgets/rules.dart';

class Thema extends StatelessWidget {
  const Thema({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    var chapter =
        context.watch<DynamicData>().chapters?.firstWhere((c) => c.url == name);
    return Scaffold(
      appBar: AppBar(title: Text(chapter?.title.toUpperCase() ?? '')),
      body: chapter == null
          ? null
          : ListView(padding: const EdgeInsets.all(20), children: [
              ...chapter.subchapters
                  .where((s) => s.content?.isNotEmpty ?? false)
                  .map((s) => Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            s.title?.isEmpty ?? false
                                ? Container()
                                : Text(s.title?.toUpperCase() ?? '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge),
                            s.description == null
                                ? Container()
                                : Text(s.description!),
                            ...s.content
                                    ?.map((i) => Rules(
                                        type: i.type,
                                        title: i.title,
                                        description: i.description,
                                        rules: i.list ?? []))
                                    .toList() ??
                                []
                          ])))
                  .toList(),
              ...chapter.moreInfo == null
                  ? []
                  : [
                      Text(chapter.moreInfo!.title,
                          style: Theme.of(context).textTheme.headlineLarge),
                      InfoItem(
                          type: name,
                          text:
                              'Bekijk ook zeker onze vraag en antwoorden over ${chapter.title}! [Vragen en antwoorden](/vragen-en-antwoorden)'),
                      ...chapter.moreInfo!.list
                              ?.map((e) => InfoItem(type: name, text: e.title))
                              .toList() ??
                          [],
                    ],
            ]),
    );
  }
}
