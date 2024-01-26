class SensorModel {
  SensorModel({this.value, this.timestamp});

  double? value;
  String? timestamp;

  SensorModel.fromJson(Map<String, dynamic> json) {
    value = double.parse(json['value'].toStringAsFixed(1));
    timestamp = json['timestamp'].toString();
  }
}
