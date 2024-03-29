class ClientPath {
  static Uri temperature(int id, int count) {
    return Uri.parse(
        "http://192.168.242.252:8000/devices/$id/sensors/temperature/?count=$count");
  }

  static Uri humidity(int id, int count) {
    return Uri.parse(
        "http://192.168.242.252:8000/devices/$id/sensors/humidity/?count=$count");
  }

  static Uri lighting(int id, int count) {
    return Uri.parse(
        "http://192.168.242.252:8000/devices/$id/sensors/lighting/?count=$count");
  }

  static Uri imageData(int id, int count) {
    return Uri.parse("http://10.0.2.2:8000/devices/$id/camera/?count=$count");
  }

  static Uri image(String path) {
    return Uri.parse("http://10.0.2.2:8000$path");
  }

  static Uri ledValue(int id) {
    return Uri.parse("http://192.168.242.252:8000/devices/$id/led_value/");
  }
}
