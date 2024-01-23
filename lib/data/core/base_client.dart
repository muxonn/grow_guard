import 'package:http/http.dart' as http;

abstract class GGBaseClient {
  Future<dynamic> get(Uri uri) {
    return http.get(uri);
  }

  Future<dynamic> post(Uri uri, Map<String, dynamic> body) {
    return http.post(uri, body: body);
  }

  Future<dynamic> put(Uri uri, Map<String, dynamic> body) {
    return http.put(uri, body: body);
  }
}
