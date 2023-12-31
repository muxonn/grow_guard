import 'package:flutter/material.dart';
import 'package:grow_guard/utils/colors.dart';

class UnactivePlantBlock extends StatelessWidget {
  const UnactivePlantBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        color: forestGreen.withOpacity(0.3),
      ),
      width: 130,
      height: 160,
      child: const Center(
        child: Icon(
          Icons.add_rounded,
          color: coldGray,
          size: 40,
        ),
      ),
    );
  }
}
