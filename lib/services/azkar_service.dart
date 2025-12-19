import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/zekr_model.dart';

class AzkarService {
  static Future<List<Zekr>> loadAzkar(String jsonPath) async {
    final prefs = await SharedPreferences.getInstance();

    final jsonString = await rootBundle.loadString(jsonPath);
    final data = json.decode(jsonString);

    final List list = data['content'];

    return List.generate(list.length, (index) {
      final savedCurrent =
          prefs.getInt('$jsonPath-$index') ?? 0;

      return Zekr.fromJson(
        list[index],
        current: savedCurrent,
      );
    });
  }

  static Future<void> saveZekr(
    String jsonPath,
    int index,
    int current,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('$jsonPath-$index', current);
  }

  static Future<void> reset(String jsonPath, int count) async {
    final prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < count; i++) {
      prefs.remove('$jsonPath-$i');
    }
  }
}
