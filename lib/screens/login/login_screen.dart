import 'package:animacao_complexa/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/scheduler.dart' show timeDilation;

import 'package:animacao_complexa/screens/login/widgets/form_container.dart';
import 'package:animacao_complexa/screens/login/widgets/sign_up_button.dart';
import 'package:animacao_complexa/screens/login/widgets/stagger_animation.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 2,
      ),
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //timeDilation = 1;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 70.0, bottom: 32.0),
                      child: Image.asset(
                        "images/tickicon.png",
                        width: 150.0,
                        height: 150.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                    FormContainer(),
                    SignUpButton(),
                  ],
                ),
                StaggerAnimation(
                  controller: _animationController.view,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
