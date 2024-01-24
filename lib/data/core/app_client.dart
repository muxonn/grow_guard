import 'package:grow_guard/data/core/base_client.dart';
import 'package:grow_guard/data/core/client_path.dart';

class AppClient extends GGBaseClient {
  Future<dynamic> getTemperature(int id, int count) async {
    final response = await get(ClientPath.temperature(id, count));
    return response;
  }

  Future<dynamic> getLighting(int id, int count) async {
    final response = await get(ClientPath.lighting(id, count));
    return response;
  }

  Future<dynamic> getHumidity(int id, int count) async {
    final response = await get(ClientPath.humidity(id, count));
    return response;
  }
}
