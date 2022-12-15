import 'package:campus_team_up/core/util/pageIndicator.dart';
import 'package:campus_team_up/ui/discovery_page/discoveryPageLogic.dart';
import 'package:campus_team_up/ui/discovery_page/post.dart';
import 'package:campus_team_up/ui/gradient_background/gradient_background.dart';
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
    return GradientBackground(
      body: _body(context),
      bottomNavigationBar: sNavigationBar(pageIndicator: PageIndicator.discovery),
    );
   
  }
}

Widget _body(BuildContext context) {
  final logic = Get.find<DiscoveryPageLogic>();
  return ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          alignment: Alignment.center,
          child: Post(),
        ),
        separatorBuilder: (context, index) => SizedBox(
          height: 30,
        ),
      );
}
