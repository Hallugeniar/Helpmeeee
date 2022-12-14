import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:campus_team_up/routes/route.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  final route = RouteManager();
  runApp(GetMaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    getPages: route.routes,
    initialRoute: route.initialRoute,
    unknownRoute: route.unknownRoute,
    routingCallback: route.routingCallback,
  ));
}
