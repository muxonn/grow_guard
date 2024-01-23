import 'package:grow_guard/data/core/base_client.dart';
import 'package:grow_guard/data/core/client_path.dart';

class AppClient extends GGBaseClient {
  Future<dynamic> getTemperature(int id, int count) async {
    final response = await get(ClientPath.temperature(id, count));
    return response;
  }
}
