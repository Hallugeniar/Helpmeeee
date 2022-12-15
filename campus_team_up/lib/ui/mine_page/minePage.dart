import 'package:campus_team_up/core/util/pageIndicator.dart';
import 'package:campus_team_up/ui/gradient_background/gradient_background.dart';
import 'package:campus_team_up/ui/mine_page/minePageLogic.dart';
import 'package:campus_team_up/ui/navigation_bar/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MinePage extends StatelessWidget {
  MinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(MinePageLogic());
    if (!logic.inited) {
      logic.setUpStates(Get.currentRoute, context);
    }
    return GradientBackground(
      body: _body(context),
      bottomNavigationBar: sNavigationBar(pageIndicator: PageIndicator.mine),
    );
  }
}

Widget _body(BuildContext context) {
  final logic = Get.find<MinePageLogic>();
  final deviceWidth = MediaQuery.of(context).size.width;
  final iconContainerSize = deviceWidth * 0.20;
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [_avatar(), Text('userAccount@scnu.com')],
      ),
      _button(Icons.badge, 'i18n alter nickName', () {}),
      _button(Icons.person, 'i18n alter profile', () {}),
      _button(Icons.logout, 'i18n logout', () {
        Get.offAllNamed('/login');
      })
    ],
  );
}

Widget _avatar() {
  double size = 128;
  return Material(
    elevation: 10,
    borderRadius: BorderRadius.all(Radius.circular(size / 2)),
    child: Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                'https://i2.hdslb.com/bfs/face/8c883fbb3acd84c3ffd1a34424559a9c885b9636.jpg'),
            fit: BoxFit.cover),
        shape: BoxShape.circle,
      ),
    ),
  );
}

Widget _button(IconData icon, String buttonText, Function() onClick) {
  final buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFAFFFF)),
      foregroundColor: MaterialStateProperty.all<Color>(Color(0xFFC43DF3)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.white))));
  return ElevatedButton(
      onPressed: onClick,
      style: buttonStyle,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Icon(icon),
          ),
          Text(buttonText)
        ],
      ));
}
