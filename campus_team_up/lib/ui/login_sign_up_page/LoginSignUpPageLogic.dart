import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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
  final signUpRoute = '/signUp';
  final loginRoute = '/login';

  setUpStates(String currentRoute, BuildContext context,GlobalKey<FormBuilderState> formKey) {
    //TODO bug try switch page when softkeyboard popup, and it will not shows up when break point
    // will got formkey(globalKey) duplicated 
    // print('setup');
    inited = true;
    logicFormKey = formKey;
    if (currentRoute == signUpRoute) {
      showCaptcha = true;
      buttonText = "i18n signup";
      switchText = "i18n aleary have account?";
      switchRoute = loginRoute;
    } else {
      showCaptcha = false;
      buttonText = "i18n login";
      switchText = "i18n don't have account?";
      switchRoute = signUpRoute;
    }
  }

  switchTextVisibility(){
    textVisibility = !textVisibility;
    update();
  }
}
