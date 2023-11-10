import 'package:flutter/material.dart';
import 'package:grow_guard/views/plant_page.dart';
import 'package:grow_guard/utils/colors.dart';
import 'package:grow_guard/utils/unactive_plant_block.dart';

class PlantBlock extends StatelessWidget {
  final String title;
  final String image;

  const PlantBlock({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("shroom");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PlantPage(),
          ),
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: const BoxDecoration(
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
                  title,
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
              "assets/images/" + image,
              width: 120,
            ),
          ),
        ],
      ),
    );
  }
}
