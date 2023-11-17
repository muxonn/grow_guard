import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:grow_guard/ui/info_navigator.dart';
import 'package:grow_guard/ui/stats_navigator.dart';
import 'package:grow_guard/utils/colors.dart';
import 'package:grow_guard/utils/sensor_data.dart';
import 'package:grow_guard/views/info_page.dart';
import 'package:grow_guard/views/stats_page.dart';

class PlantPage extends HookWidget {
  const PlantPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final page_index = useState(0);

    final pages = [InfoPage(size: size), StatsPage()];

    return Scaffold(
      backgroundColor: forestGreen,
      appBar: AppBar(
        toolbarHeight: 130,
        title: const Text(
          "Dashboard",
          style: TextStyle(fontSize: 20),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            size: 36,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: InfoPage(size: size),
      bottomNavigationBar: Container(
        color: Colors.white,
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
    );
  }
}
