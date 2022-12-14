import 'package:campus_team_up/core/util/pageIndicator.dart';
import 'package:campus_team_up/ui/discovery_page/discoveryPageLogic.dart';
import 'package:campus_team_up/ui/discovery_page/post.dart';
import 'package:campus_team_up/ui/navigation_bar/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiscoveryPage extends StatelessWidget {
  DiscoveryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(DiscoveryPageLogic());
    if (!logic.inited) {
      logic.setUpStates(Get.currentRoute, context);
    }
    return Scaffold(
      body: _body(context),
      bottomNavigationBar: sNavigationBar(pageIndicator: PageIndicator.discovery),
    );
  }
}

Widget _body(BuildContext context) {
  final logic = Get.find<DiscoveryPageLogic>();
  return Stack(
    children: [
      _backGround(),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Post()
          ],
        ),
      ),
    ],
  );
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
