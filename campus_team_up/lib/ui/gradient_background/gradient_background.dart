import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GradientBackground extends StatelessWidget {
  final Widget body;
  final bool whited;
  final Widget? bottomNavigationBar;

  const GradientBackground(
      {super.key,
      required this.body,
      this.bottomNavigationBar,
      this.whited = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          _backGround(),
          if (whited)
            Container(
              color: Color.fromARGB(109, 255, 255, 255),
            ),
          body
        ]),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

Widget _backGround() {
  return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
    colors: [
      Color(0xFFCCEFEB),
      Color(0xFF63DAFF),
      Color(0xFF8B81EC),
      Color(0xFFC72AFE)
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  )));
}
