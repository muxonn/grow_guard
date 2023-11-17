import 'package:flutter/material.dart';
import 'package:grow_guard/utils/sensor_data.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 400,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/pleurotus-eryngii.png"),
            ),
          ),
          transform: Matrix4.translationValues(-200, -40, 0),
        ),
        const Align(
          alignment: Alignment.topCenter,
          child: Wrap(
            runSpacing: 12,
            children: [
              SensorData(
                type: "Temperature",
                icon: Icons.thermostat,
                controlled: false,
                value: 27,
              ),
              SizedBox(height: 10),
              SensorData(
                type: "Light",
                icon: Icons.light_mode_rounded,
                controlled: false,
                value: 110,
              ),
              SizedBox(height: 10),
              SensorData(
                type: "Humidity",
                icon: Icons.water_drop_rounded,
                controlled: false,
                value: 40,
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Colors.white,
                ),
                width: size.width,
                height: size.height / 8,
              ),
              Positioned.fill(
                top: -40,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    width: 120,
                    height: 120,
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      size: 80,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
