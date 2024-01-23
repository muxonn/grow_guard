import 'dart:convert';

import 'package:grow_guard/data/core/app_client.dart';
import 'package:grow_guard/data/models/sensor_model.dart';

class SensorRepository {
  Future<SensorModel?> getSensorData(int id, int count) async {
    AppClient client = AppClient();

    try {
      final response = await client.getTemperature(id, count);
      final Map<String, dynamic> body = jsonDecode(response.body);

      return SensorModel.fromJson(body);
    } catch (e) {
      print('Exception! $e');
      return null;
    }
  }
}
