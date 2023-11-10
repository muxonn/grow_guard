import 'package:flutter/material.dart';
import 'package:grow_guard/ui/info_navigator.dart';
import 'package:grow_guard/ui/stats_navigator.dart';
import 'package:grow_guard/utils/colors.dart';
import 'package:grow_guard/utils/sensor_data.dart';

class PlantPage extends StatelessWidget {
  const PlantPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: forestGreen,
      appBar: AppBar(
        toolbarHeight: 130,
        title: Text(
          "Dashboard",
          style: TextStyle(fontSize: 20),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            size: 36,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
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
          Align(
            alignment: Alignment.topCenter,
            child: Wrap(
              runSpacing: 12,
              children: const [
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
                  height: size.height / 4,
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
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: 80,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      children: [
                        InfoNavigator(
                          size: size,
                          text: "Information",
                          active: true,
                        ),
                        StatsNavigator(
                          size: size,
                          text: "Statistics",
                          active: false,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
