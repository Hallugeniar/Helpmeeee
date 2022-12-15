import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:campus_team_up/core/util/pageIndicator.dart';
import 'package:campus_team_up/routes/route.dart';

class sNavigationBar extends StatelessWidget {
  sNavigationBar({required this.pageIndicator, Key? key}) : super(key: key);
  final PageIndicator pageIndicator;
  final RouteManager _route = RouteManager();

  _navigationBarItems(BuildContext context) => [
        BottomNavigationBarItem(
          icon: const Icon(Icons.search),
          label: AppLocalizations.of(context).discovery,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.post_add),
          label: AppLocalizations.of(context).publish,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.inbox),
          label: AppLocalizations.of(context).inbox,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: AppLocalizations.of(context).mine,
        ),
      ];

  int _getPageIndex(PageIndicator indicator) {
    return PageIndicator.values.indexOf(indicator);
  }

  String _getPageRouteName(int index) {
    return _route.routes[index].name;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color(0xFFC030FC),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF63DAFF),
        selectedIconTheme: IconThemeData(color: Color(0xFF8B81EC), size: 50),
        unselectedItemColor: Color(0xFF64D8FF),
        items: _navigationBarItems(context),
        currentIndex: _getPageIndex(pageIndicator),
        onTap: (index) {
          //until ?
          Get.offNamedUntil(_getPageRouteName(index), ((route) => false));
        },
      ),
    );
  }
}
