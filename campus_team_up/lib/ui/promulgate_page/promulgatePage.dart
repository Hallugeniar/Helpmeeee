import 'package:campus_team_up/core/util/pageIndicator.dart';
import 'package:campus_team_up/ui/navigation_bar/navigation_bar.dart';
import 'package:campus_team_up/ui/promulgate_page/promulgatePageLogic.dart';
import 'package:campus_team_up/ui/promulgate_page/post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PromulgatePage extends StatelessWidget {
  PromulgatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(PromulgatePageLogic());
    if (!logic.inited) {
      logic.setUpStates(Get.currentRoute, context);
    }
    return Scaffold(
      body: _body(context),
      bottomNavigationBar:
          sNavigationBar(pageIndicator: PageIndicator.promulgate),
    );
  }
}

Widget _body(BuildContext context) {
  final logic = Get.find<PromulgatePageLogic>();
  return Stack(
    children: [
      _backGround(),
      ListView(
        shrinkWrap: true,
        children: [Center(child: Post())],
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
