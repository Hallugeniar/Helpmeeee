import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GradientBackground extends StatelessWidget {
  final Widget body;
  final Widget? bottomNavigationBar;

  const GradientBackground(
      {super.key, required this.body, this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        _backGround(),
        body
      ]),
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
