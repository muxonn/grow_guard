class SensorModel {
  SensorModel({this.value, this.timestamp});

  double? value;
  String? timestamp;

  SensorModel.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    timestamp = json['timestamp'].toString();
  }
}
