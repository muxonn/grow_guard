import 'dart:convert';

import 'package:grow_guard/data/core/app_client.dart';
import 'package:grow_guard/data/models/led_model.dart';

class LedRepository {
  Future<LedModel?> getLedValue(int id) async {
    AppClient client = AppClient();

    try {
      final response = await client.getLedValue(id);

      final Map<String, dynamic> body = jsonDecode(response.body);
      return LedModel.fromJson(body);
    } catch (e) {
      print("Exception! $e");
      return null;
    }
  }
}
