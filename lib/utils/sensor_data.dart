import 'package:flutter/material.dart';
import 'optimal_parameters.dart';

class SensorData extends StatelessWidget {
  const SensorData({
    super.key,
    required this.type,
    required this.icon,
    required this.controlled,
    required this.value,
  });

  final String type;
  final IconData icon;
  final bool controlled;
  final int value;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final parameter;
    final unit;

    if (type == "Temperature") {
      parameter = tempParam;
      unit = "°C";
    } else if (type == "Light") {
      parameter = lightParam;
      unit = "lux";
    } else if (type == "Humidity") {
      parameter = humidityParam;
      unit = "%";
    } else {
      parameter = {"min": 0, "max": 0};
      unit = "";
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(-3, 3)),
            ],
          ),
          width: size.width / 1.5,
          height: size.height / 7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 70,
                      child: Column(
                        children: [
                          Icon(
                            icon,
                            size: 38,
                          ),
                          SizedBox(height: 5),
                          Text(type, style: TextStyle(fontSize: 10)),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(value.toString() + unit,
                        style: TextStyle(fontSize: 30)),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Circle on the right-hand side
        Positioned(
          left: size.width / 1.65,
          bottom: size.height / 12,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            width: size.width / 12,
            height: size.height / 12,
            child: Icon(
              value > parameter["min"] && value < parameter["max"]
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
