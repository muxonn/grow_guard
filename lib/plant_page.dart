import 'package:flutter/material.dart';
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
          Column(
            children: const [
              Center(
                child: SensorData(
                    type: "Temperature",
                    icon: Icons.thermostat,
                    controlled: false),
              ),
            ],
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
