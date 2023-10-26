import 'package:flutter/material.dart';
import 'package:grow_guard/utils/colors.dart';

class PlantBlock extends StatelessWidget {
  final String blockTitle;
  final String blockImage;

  const PlantBlock(
      {super.key, required this.blockTitle, required this.blockImage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            color: forestGreen,
          ),
          width: 130,
          height: 160,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(left: 10, bottom: 20),
              child: Text(
                blockTitle,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: -20,
          left: 10,
          child: Image.asset(
            "assets/images/" + blockImage,
            width: 120,
          ),
        ),
      ],
    );
  }
}
