import 'package:flutter/material.dart';
import 'package:grow_guard/data/core/app_types.dart';
import 'package:grow_guard/utils/charts/new_bar_chart.dart';
import 'package:grow_guard/utils/colors.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Text(
            "Temperature",
            style: TextStyle(color: forestGreen),
          ),
          NewBarChart(deviceId: 1, type: SensorType.temperature),
          SizedBox(height: 10),
          Text(
            "Light",
            style: TextStyle(color: forestGreen),
          ),
          NewBarChart(deviceId: 1, type: SensorType.lighting),
          SizedBox(height: 10),
          Text(
            "Humidity",
            style: TextStyle(color: forestGreen),
          ),
          NewBarChart(deviceId: 1, type: SensorType.humidity),
        ],
      ),
    );
  }
}
