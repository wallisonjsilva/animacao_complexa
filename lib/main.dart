import 'package:flutter/material.dart';

import 'package:animacao_complexa/screens/login/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Animations Intro",
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
