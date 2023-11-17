import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:grow_guard/ui/info_navigator.dart';
import 'package:grow_guard/ui/stats_navigator.dart';
import 'package:grow_guard/utils/colors.dart';
import 'package:grow_guard/views/info_page.dart';
import 'package:grow_guard/views/stats_page.dart';

class PlantPage extends HookWidget {
  const PlantPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pageIndex = useState(0);
    final infoActive = useState(true);
    final bgColor = useState(forestGreen);
    final navColor = useState(Colors.white);

    final pages = [InfoPage(size: size), StatsPage(size: size)];

    void changePage(int index) {
      if (index == 0) {
        pageIndex.value = 0;
        infoActive.value = true;
        bgColor.value = forestGreen;
        navColor.value = Colors.white;
      } else {
        pageIndex.value = 1;
        infoActive.value = false;
        bgColor.value = Colors.white;
        navColor.value = forestGreen;
      }
    }

    return Scaffold(
      backgroundColor: bgColor.value,
      appBar: AppBar(
        toolbarHeight: 130,
        title: Text(
          "Dashboard",
          style: TextStyle(
            fontSize: 20,
            color: navColor.value,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            size: 36,
            color: navColor.value,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: pages[pageIndex.value],
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: [
            InkWell(
              onTap: () {
                changePage(0);
              },
              child: InfoNavigator(
                size: size,
                text: "Information",
                active: infoActive.value,
              ),
            ),
            InkWell(
              onTap: () {
                changePage(1);
              },
              child: StatsNavigator(
                size: size,
                text: "Statistics",
                active: !infoActive.value,
              ),
            )
          ],
        ),
      ),
    );
  }
}
