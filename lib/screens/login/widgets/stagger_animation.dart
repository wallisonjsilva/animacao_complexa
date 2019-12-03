import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;

  final Animation<double> buttonSqueze;
  final Animation<double> buttonZoomOut;

  StaggerAnimation({this.controller})
      : buttonSqueze = Tween(begin: 320.0, end: 50.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.150),
          ),
        ),
        buttonZoomOut = Tween(begin: 60.0, end: 1000.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.5, 1, curve: Curves.bounceOut),
          ),
        );

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 45.0,
      ),
      child: InkWell(
        onTap: () {
          controller.forward();
        },
        child: Hero(
          tag: "fade",
          child: buttonZoomOut.value <= 60
              ? Container(
                  width: buttonSqueze.value,
                  height: 50.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(247, 64, 106, 1.0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),
                  child: _builderInside(context),
                )
              : Container(
                  width: buttonZoomOut.value,
                  height: buttonZoomOut.value,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(247, 64, 106, 1.0),
                    borderRadius: buttonZoomOut.value < 500
                        ? BorderRadius.all(
                            Radius.circular(30.0),
                          )
                        : BorderRadius.all(
                            Radius.circular(0.0),
                          ),
                  ),
                ),
        ),
      ),
    );
  }

  Widget _builderInside(BuildContext context) {
    if (buttonSqueze.value > 75) {
      return Text(
        "Sign in",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3,
        ),
      );
    } else {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        strokeWidth: 1.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}
