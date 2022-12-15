import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

enum PageState { forgot, login, signUp }

class LoginSignUpPageLogic extends GetxController {
  bool inited = false;

  //todo random key for certain route page?
  late GlobalKey<FormBuilderState> logicFormKey;
  late bool showCaptcha;
  late String buttonText;
  late String switchText;
  late String switchRoute;
  bool textVisibility = false;
  IconData icon = Icons.person;
  final signUpRoute = '/signUp';
  final loginRoute = '/login';

  setUpStates(String currentRoute, BuildContext context) {
    //TODO bug try switch page when softkeyboard popup, and it will not shows up when break point
    // will got formkey(globalKey) duplicated
    // print('setup');
    inited = true;
    logicFormKey = GlobalKey<FormBuilderState>(debugLabel: currentRoute);
    if (currentRoute == signUpRoute) {
      showCaptcha = true;
      buttonText = AppLocalizations.of(context).sign_up;
      switchText = AppLocalizations.of(context).already_have_an_account;
      switchRoute = loginRoute;
      icon = Icons.person_add;
    } else {
      showCaptcha = false;
      buttonText = AppLocalizations.of(context).login;
      switchText = AppLocalizations.of(context).dont_have_an_account;
      switchRoute = signUpRoute;
    }
  }


  switchTextVisibility() {
    textVisibility = !textVisibility;
    update();
  }
}
