import 'package:flutter/material.dart';
import 'colors.dart';

class DeviceBlock extends StatelessWidget {
  final IconData deviceIcon;
  final String deviceText;

  const DeviceBlock({required this.deviceIcon, required this.deviceText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: coldGreen,
        border: Border.all(
          color: forestGreen,
          width: 4,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      width: 120,
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            deviceIcon,
            size: 46,
            color: darkBlack,
          ),
          const SizedBox(height: 10),
          Text(
            deviceText,
            style: const TextStyle(
              color: darkBlack,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
