import 'package:campus_team_up/core/util/pageIndicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:campus_team_up/ui/gradient_background/gradient_background.dart';
import 'package:campus_team_up/ui/inbox_page/inboxPageLogic.dart';
import 'package:campus_team_up/ui/navigation_bar/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InboxPage extends StatelessWidget {
  InboxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(InboxPageLogic());
    if (!logic.inited) {
      logic.setUpStates(Get.currentRoute, context);
    }
    return GradientBackground(
      body: _body(context),
      bottomNavigationBar: sNavigationBar(pageIndicator: PageIndicator.inbox),
    );
  }
}

Widget _body(BuildContext context) {
  final logic = Get.find<InboxPageLogic>();
  final deviceWidth = MediaQuery.of(context).size.width;
  final iconContainerSize = deviceWidth * 0.20;
  return Column(
    children: [
      Row(
        children: [
          _iconContainer(Icons.favorite, size: iconContainerSize),
          _iconContainer(Icons.thumb_up, size: iconContainerSize)
        ],
      ),
      Expanded(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              border: Border.all(color: Color(0xFFAFAFAF), width: 2),
            ),
            child: Center(child: Text(AppLocalizations.of(context).no_message)),
          ),
        ),
      )
    ],
  );
}

Widget _iconContainer(IconData iconData, {double size = 64}) {
  return Padding(
    padding: EdgeInsets.all(5),
    child: Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Color(0xFFC43DF3),
        borderRadius: BorderRadius.all(Radius.circular(15)),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: FittedBox(
        fit: BoxFit.fill,
        child: Padding(
          padding: EdgeInsets.all(2),
          child: Icon(
            iconData,
            color: Color(0xFF63DAFF),
          ),
        ),
      ),
    ),
  );
}
