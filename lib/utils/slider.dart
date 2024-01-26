import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:grow_guard/data/led_repository.dart';
import 'package:grow_guard/utils/colors.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SliderExample extends HookWidget {
  SliderExample({super.key});

  Future<double?> fetchData() async {
    LedRepository repository = LedRepository();
    var data = await repository.getLedValue(1);
    if (data != null) {
      print(data.value);
      return data.value;
    }

    return 0.0;
  }

  Future<void> sendPutRequest(double value, int id) async {
    final url = Uri.parse('http://192.168.242.252:8000/devices/$id/led_value/');
    final Map<String, dynamic> payload = {'value': value};

    try {
      final response = await http.put(
        url,
        body: jsonEncode(payload),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        print('PUT request successful');
      } else {
        print(
            'Failed to send PUT request. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error sending PUT request: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final future = useMemoized(fetchData);
    final snapshot = useFuture(future);
    final currentSliderValue = useState(0.0);
    final loaded = useState(false);

    if (snapshot.hasData && loaded.value == false) {
      currentSliderValue.value = snapshot.data!;
      loaded.value = true;
      print(snapshot.data);
    }

    return loaded.value
        ? Container(
            width: 300,
            child: Slider(
              activeColor: forestGreen,
              value: currentSliderValue.value,
              max: 100,
              divisions: 10,
              label: currentSliderValue.value.round().toString(),
              onChanged: (double value) {
                currentSliderValue.value = value;
                print(currentSliderValue.value);
                sendPutRequest(value, 1);
              },
            ))
        : LoadingAnimationWidget.waveDots(color: forestGreen, size: 50);
  }
}
