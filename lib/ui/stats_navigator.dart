import 'package:flutter/material.dart';
import '../utils/colors.dart';

class StatsNavigator extends StatelessWidget {
  const StatsNavigator({
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
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40)),
          color: active ? Colors.white : forestGreen),
      height: size.height / 9,
      width: size.width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.bar_chart,
                  color: active ? Colors.black : Colors.white),
              SizedBox(width: 10),
              Text(
                text,
                style: TextStyle(
                  fontSize: 22,
                  color: active ? Colors.black : Colors.white,
                ),
              ),
            ],
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
