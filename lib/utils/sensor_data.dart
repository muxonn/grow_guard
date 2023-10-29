import 'package:flutter/material.dart';

class SensorData extends StatelessWidget {
  final String type;
  final IconData icon;
  final bool controlled;
  const SensorData(
      {super.key,
      required this.type,
      required this.icon,
      required this.controlled});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            color: Colors.white,
          ),
          width: size.width / 1.5,
          height: size.height / 7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Icon(
                          icon,
                          size: 38,
                        ),
                        Text(type, style: TextStyle(fontSize: 10)),
                      ],
                    ),
                    SizedBox(width: 20),
                    Text("21C", style: TextStyle(fontSize: 30)),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Circle on the right-hand side
        Positioned(
          left: size.width / 1.65,
          bottom: size.height / 12,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            width: size.width / 12,
            height: size.height / 12,
            child: Icon(
              Icons.done_outlined,
              color: Colors.black,
              size: 28,
            ),
          ),
        ),
      ],
    );
  }
}
