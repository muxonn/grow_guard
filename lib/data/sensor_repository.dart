import 'dart:convert';

import 'package:grow_guard/data/core/app_client.dart';
import 'package:grow_guard/data/models/sensor_model.dart';

class SensorRepository {
  Future<List<SensorModel>?> getSensorData(int id, int count) async {
    AppClient client = AppClient();

    try {
      final response = await client.getTemperature(id, count);
      if (response.statusCode == 200) {
        final List<SensorModel> dataList = (jsonDecode(response.body) as List)
            .map((json) => SensorModel.fromJson(json)) as List<SensorModel>;
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
