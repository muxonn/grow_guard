import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphic/graphic.dart';
import 'package:grow_guard/data/core/app_types.dart';
import 'package:grow_guard/data/sensor_repository.dart';
import 'package:grow_guard/utils/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class NewBarChart extends HookWidget {
  const NewBarChart({
    super.key,
    required this.deviceId,
    required this.type,
  });

  final int deviceId;
  final SensorType type;

  Future<List<Map<dynamic, dynamic>>> fetchData() async {
    SensorRepository repository = SensorRepository();
    var data = await repository.getSensorData(deviceId, 10, type);

    if (data != null && data.isNotEmpty) {
      List<Map<dynamic, dynamic>> mappedData = data.map((sensor) {
        String datePart = sensor.timestamp!.substring(0, 10);
        String timePart = sensor.timestamp!.substring(11, 19);
        String formattedTimestamp = '$datePart $timePart';
        return {
          'value': sensor.value,
          'timestamp': formattedTimestamp,
        };
      }).toList();

      return mappedData;
    }

    return [];
  }

  @override
  Widget build(BuildContext context) {
    final future = useMemoized(fetchData);
    final snapshot = useFuture(future);
    final loaded = useState(false);

    if (snapshot.hasData) {
      Timer(Duration(seconds: 1), () {
        print("Yeah, this line is printed after 3 seconds");
        loaded.value = true;
      });
    }

    return Container(
      height: 130,
      width: 370,
      child: loaded.value
          ? Chart(
              data: snapshot.data!,
              variables: {
                'timestamp': Variable(
                  accessor: (Object map) => (map as Map)['timestamp'] as String,
                  scale: OrdinalScale(tickCount: 3),
                ),
                'value': Variable(
                  accessor: (Object map) => (map as Map)['value'] as num,
                ),
              },
              marks: [
                IntervalMark(
                  color: ColorEncode(value: forestGreen),
                ),
              ],
              axes: [
                Defaults.horizontalAxis,
                Defaults.verticalAxis,
              ],
            )
          : Center(
              child: LoadingAnimationWidget.waveDots(
                  color: forestGreen, size: 50)),
    );
  }
}
