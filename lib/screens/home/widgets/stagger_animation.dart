import 'package:animacao_complexa/screens/home/widgets/fade_container.dart';
import 'package:flutter/material.dart';

import 'package:animacao_complexa/screens/home/widgets/animated_list_view.dart';
import 'package:animacao_complexa/screens/home/widgets/home_top.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;

  final Animation<double> containerGrow;
  final Animation<EdgeInsets> listSlidePosition;
  final Animation<Color> fadeAnimation;

  StaggerAnimation({@required this.controller})
      : containerGrow = CurvedAnimation(
          parent: controller,
          curve: Curves.ease,
        ),
        listSlidePosition = EdgeInsetsTween(
          begin: EdgeInsets.only(bottom: 0),
          end: EdgeInsets.only(bottom: 80),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.325, //porcentage
              0.8, //porcentage
              curve: Curves.ease,
            ),
          ),
        ),
        fadeAnimation = ColorTween(
          begin: Color.fromRGBO(247, 64, 106, 1.0),
          end: Color.fromRGBO(247, 64, 106, 0.0),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.decelerate,
          ),
        );

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Stack(
      children: <Widget>[
        ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            HomeTop(
              containerGrow: containerGrow,
            ),
            AnimatedListView(
              listSlidePosition: listSlidePosition,
            ),
          ],
        ),
        IgnorePointer(
          child: FadeContainer(
            fadeAnimation: fadeAnimation,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AnimatedBuilder(
          animation: controller,
          builder: _buildAnimation,
        ),
      ),
    );
  }
}
