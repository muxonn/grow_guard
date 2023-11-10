import 'package:flutter/material.dart';
import 'package:grow_guard/views/login_page.dart';

import 'views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Arial Rounded"),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
