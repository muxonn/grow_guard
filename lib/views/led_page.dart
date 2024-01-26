import 'package:flutter/material.dart';
import 'package:grow_guard/utils/colors.dart';
import 'package:grow_guard/utils/slider.dart';

class LedPage extends StatelessWidget {
  const LedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        title: Text(
          "Dashboard",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            size: 36,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            Text(
              "Control your LED!",
              style: TextStyle(color: forestGreen, fontSize: 30),
            ),
            SizedBox(height: 30),
            SliderExample(),
          ],
        ),
      ),
    );
  }
}
