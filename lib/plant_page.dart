import 'package:flutter/material.dart';
import 'package:grow_guard/utils/colors.dart';

class PlantPage extends StatelessWidget {
  const PlantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: forestGreen,
      appBar: AppBar(
        toolbarHeight: 130,
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
      body: Container(
        width: 400,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/pleurotus-eryngii.png"),
          ),
        ),
        transform: Matrix4.translationValues(-200, -40, 0),
      ),
    );
  }
}
