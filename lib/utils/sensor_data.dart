import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:grow_guard/data/core/app_types.dart';
import 'package:grow_guard/data/sensor_repository.dart';
import 'package:grow_guard/utils/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'optimal_parameters.dart';

class SensorData extends HookWidget {
  const SensorData({
    super.key,
    required this.type,
    required this.icon,
    required this.controlled,
    required this.deviceId,
  });

  final SensorType type;
  final IconData icon;
  final bool controlled;
  final int deviceId;

  Future<double> fetchData() async {
    SensorRepository repository = SensorRepository();
    var data = await repository.getSensorData(deviceId, 1, type);
    if (data != null && data.isNotEmpty) {
      print(data[0].timestamp);
      return data[0].value!;
    }

    return 0;
  }

  @override
  Widget build(BuildContext context) {
    fetchData();
    final future = useMemoized(fetchData);
    final snapshot = useFuture(future);

    final value = useState(0.0);
    final loaded = useState(false);
    final size = MediaQuery.of(context).size;
    final Map<String, int> parameter;
    final String unit;
    final String name;

    if (type == SensorType.temperature) {
      parameter = tempParam;
      unit = "°C";
      name = "Temperature";
    } else if (type == SensorType.lighting) {
      parameter = lightParam;
      unit = "lux";
      name = "Light";
    } else if (type == SensorType.humidity) {
      parameter = humidityParam;
      unit = "%";
      name = "Humidity";
    } else {
      parameter = {"min": 0, "max": 0};
      unit = "";
      name = "Not defined";
    }

    if (snapshot.hasData) {
      value.value = snapshot.data!;
      Timer(Duration(seconds: 1), () {
        print("Yeah, this line is printed after 3 seconds");
        loaded.value = true;
      });
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(-3, 3)),
            ],
          ),
          width: size.width / 1.5,
          height: size.height / 7,
          child: loaded.value
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 70,
                            child: Column(
                              children: [
                                Icon(
                                  icon,
                                  size: 38,
                                ),
                                const SizedBox(height: 5),
                                Text(name,
                                    style: const TextStyle(fontSize: 10)),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Text(value.value.toString() + unit,
                              style: const TextStyle(fontSize: 30)),
                        ],
                      ),
                    ),
                  ],
                )
              : Center(
                  child: LoadingAnimationWidget.waveDots(
                      color: darkBlack, size: 50)),
        ),
        // Circle on the right-hand side
        Positioned(
          left: size.width / 1.65,
          bottom: size.height / 12,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            width: size.width / 12,
            height: size.height / 12,
            child: Icon(
              value.value > parameter["min"]! && value.value < parameter["max"]!
                  ? Icons.done_outlined
                  : Icons.warning_rounded,
              color: Colors.black,
              size: 28,
            ),
          ),
        ),
      ],
    );
  }
}
