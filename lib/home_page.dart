import 'package:flutter/material.dart';
import 'package:grow_guard/utils/device_block.dart';
import 'utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 20),
          child: AppBar(
            toolbarHeight: 140,
            centerTitle: true,
            title: Image.asset(
              'assets/images/logo-simple.png',
              width: 70,
            ),
            leading: Icon(
              Icons.menu_rounded,
              color: Colors.black,
              size: 40,
            ),
            actions: [
              Icon(
                Icons.bar_chart,
                color: Colors.black,
                size: 40,
              )
            ],
            backgroundColor: Colors.white,
            elevation: 0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "My shrooms",
              style: TextStyle(
                color: darkBlack,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
