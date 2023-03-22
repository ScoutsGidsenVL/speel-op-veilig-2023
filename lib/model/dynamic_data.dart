import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:speelopveilig/model/chapters.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:package_info_plus/package_info_plus.dart';

const dataRepo =
    'https://raw.githubusercontent.com/ScoutsGidsenVL/speel-op-veilig-2023/main';

class DynamicData extends ChangeNotifier {
  PackageInfo? packageInfo;
  List<Chapter>? chapters;
  Map<String, String> text = {};

  DynamicData() {
    refreshData();
  }

  Future refreshData() async {
    await Future.wait([
      getPackageInfo(),
      refreshChapters(),
      refreshText('crisis'),
      refreshText('veilige_activiteit'),
      refreshText('verzekeringen'),
      refreshText('wegwijs'),
    ]);
    notifyListeners();
  }

  Future getPackageInfo() async {
    packageInfo = await PackageInfo.fromPlatform();
  }

  Future refreshChapters() async {
    var source = await fetchAsset('content/themas.json');
    var data = await json.decode(source);
    chapters = Chapters.fromJson(data).chapters;
  }

  Future refreshText(String key) async {
    text[key] = await fetchAsset('content/$key.md');
  }

  Future<String> fetchAsset(String path) async {
    try {
      if (kDebugMode) {
        throw Exception("Always read from the local bundle in debug mode");
      }
      var manager = DefaultCacheManager();
      var url = '$dataRepo/assets/$path';
      try {
        // First try to fetch the most recent version
        var fileInfo = await manager.downloadFile(url);
        return await fileInfo.file.readAsString();
      } catch (e) {
        // If that fails get the cached version
        var file = await manager.getSingleFile(url);
        return await file.readAsString();
      }
    } catch (e) {
      // If that fails read from the app bundle
      return await rootBundle.loadString('assets/$path');
    }
  }
}
