import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:grow_guard/data/core/app_types.dart';
import 'package:grow_guard/utils/sensor_data.dart';
import 'package:grow_guard/views/camera_page.dart';

class InfoPage extends HookWidget {
  const InfoPage({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final cameraShadowVisibile = useState(true);

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
            runSpacing: 15,
            children: [
              SensorData(
                type: SensorType.temperature,
                icon: Icons.thermostat,
                controlled: false,
                deviceId: 1,
              ),
              SensorData(
                type: SensorType.lighting,
                icon: Icons.light_mode_rounded,
                controlled: false,
                deviceId: 1,
              ),
              SensorData(
                type: SensorType.humidity,
                icon: Icons.water_drop_rounded,
                controlled: false,
                deviceId: 1,
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
                child: GestureDetector(
                  onTapDown: (details) {
                    cameraShadowVisibile.value = false;
                  },
                  onTapCancel: () {
                    cameraShadowVisibile.value = true;
                  },
                  onTap: () {
                    cameraShadowVisibile.value = true;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CameraPage(),
                      ),
                    );
                  },
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: cameraShadowVisibile.value
                                  ? Colors.black.withOpacity(0.2)
                                  : Colors.transparent,
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: const Offset(0, 0)),
                        ],
                      ),
                      width: 100,
                      height: 100,
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        size: 60,
                      ),
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
