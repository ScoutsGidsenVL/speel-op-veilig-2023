
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speel_op_veilig/model/chapters.dart';

class DynamicData extends ChangeNotifier {
  List<Chapter>? chapters;
  Map<String, String> text = {};

  DynamicData() {
    refreshData();
  }

  Future refreshData() async {
    await Future.delayed(const Duration(seconds: 5));
    await Future.wait([
      refreshChapters(),
      refreshText('crisis'),
      refreshText('veilige_activiteit'),
      refreshText('verzekeringen'),
      refreshText('wegwijs'),
    ]);
    notifyListeners();
  }

  Future refreshChapters() async {
    var source = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(source);
    chapters = Chapters.fromJson(data).chapters;
  }

  Future refreshText(String key) async {
    var source = await rootBundle.loadString('assets/content/$key.md');
    text[key] = source;
  }
}
