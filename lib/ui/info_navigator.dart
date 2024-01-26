import 'package:flutter/material.dart';
import '../utils/colors.dart';

class InfoNavigator extends StatelessWidget {
  const InfoNavigator({
    super.key,
    required this.size,
    required this.text,
    required this.active,
  });

  final Size size;
  final String text;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(topRight: Radius.circular(40)),
        color: active ? Colors.white : forestGreen,
      ),
      height: size.height / 10,
      width: size.width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 10),
          Text(
            text,
            style: TextStyle(
              fontSize: 22,
              color: active ? Colors.black : Colors.white,
            ),
          ),
          Container(
            height: 15,
            width: 3,
            color: active ? Colors.black : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
