import 'dart:convert';
import 'package:flutter/services.dart';

class JsonLoader {
  static Future<List<dynamic>> loadList(String assetPath) async {
    final str = await rootBundle.loadString(assetPath);
    return json.decode(str) as List<dynamic>;
  }

  static Future<Map<String, dynamic>> loadMap(String assetPath) async {
    final str = await rootBundle.loadString(assetPath);
    return json.decode(str) as Map<String, dynamic>;
  }
}
