class LedModel {
  LedModel({this.value});

  double? value;

  LedModel.fromJson(Map<String, dynamic> json) {
    value = json['value'].toDouble();
  }
}
