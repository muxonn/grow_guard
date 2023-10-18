import 'package:flutter/material.dart';
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
        preferredSize: const Size.fromHeight(240),
        child: AppBar(
          toolbarHeight: 140,
          centerTitle: true,
          title: Image.asset(
            'assets/images/logo.png',
            width: 300,
          ),
          backgroundColor: forestGreen,
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
