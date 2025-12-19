import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/zekr_model.dart';

class AzkarService {
  static Future<List<Zekr>> loadAzkar(String path) async {
    final jsonString = await rootBundle.loadString(path);
    final data = json.decode(jsonString);

    return (data['content'] as List)
        .map((e) => Zekr.fromJson(e))
        .toList();
  }
}
