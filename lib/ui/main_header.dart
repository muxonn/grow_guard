import 'package:flutter/material.dart';
import 'package:grow_guard/utils/colors.dart';

class MainHeader extends StatelessWidget {
  final String text;
  const MainHeader({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: darkBlack,
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
