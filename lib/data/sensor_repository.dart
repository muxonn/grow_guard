import 'dart:convert';

import 'package:grow_guard/data/core/app_client.dart';
import 'package:grow_guard/data/core/app_types.dart';
import 'package:grow_guard/data/models/sensor_model.dart';

class SensorRepository {
  Future<List<SensorModel>?> getSensorData(
      int id, int count, SensorType type) async {
    AppClient client = AppClient();
    final response;
    try {
      if (type == SensorType.temperature) {
        response = await client.getTemperature(id, count);
      } else if (type == SensorType.humidity) {
        response = await client.getHumidity(id, count);
      } else if (type == SensorType.lighting) {
        response = await client.getLighting(id, count);
      } else {
        return null;
      }
      if (response.statusCode == 200) {
        final List<SensorModel> dataList = (jsonDecode(response.body) as List)
            .map((json) => SensorModel.fromJson(json))
            .toList();
        //final Map<String, dynamic> body = jsonDecode(response.body);
        //return SensorModel.fromJson(body);
        return dataList;
      }
    } catch (e) {
      print('Exception! $e');
      return null;
    }
  }
}
