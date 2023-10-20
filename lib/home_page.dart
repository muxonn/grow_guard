import 'package:flutter/material.dart';
import 'package:grow_guard/utils/device_block.dart';
import 'utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(240),
        child: AppBar(
          toolbarHeight: 140,
          centerTitle: true,
          title: Image.asset(
            'assets/images/logo.png',
            width: 300,
          ),
          backgroundColor: forestGreen,
        ),
      ),
      body: Column(
        children: [
          const Text(
            "Device",
            style: TextStyle(
              color: darkBlack,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(4),
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 10,
              runSpacing: 20,
              children: [
                DeviceBlock(
                    deviceIcon: Icons.device_thermostat_outlined,
                    deviceText: "Temperature"),
                DeviceBlock(
                    deviceIcon: Icons.device_thermostat_outlined,
                    deviceText: "Temperature"),
                DeviceBlock(
                    deviceIcon: Icons.device_thermostat_outlined,
                    deviceText: "Temperature"),
                DeviceBlock(
                    deviceIcon: Icons.device_thermostat_outlined,
                    deviceText: "Temperature"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
