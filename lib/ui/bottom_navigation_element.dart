import 'package:flutter/material.dart';
import '../utils/colors.dart';

class BottomNavigationElement extends StatelessWidget {
  const BottomNavigationElement({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(40)),
        color: forestGreen,
      ),
      height: size.height / 9,
      width: size.width / 2,
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 10),
            Text("Information", style: TextStyle(fontSize: 22)),
            Container(
              height: 15,
              width: 3,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
