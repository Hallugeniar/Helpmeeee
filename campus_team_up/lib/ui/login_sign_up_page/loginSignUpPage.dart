import 'package:campus_team_up/core/util/pageIndicator.dart';
import 'package:campus_team_up/ui/login_sign_up_page/LoginSignUpPageLogic.dart';
import 'package:campus_team_up/ui/navigation_bar/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginSignUpPage extends StatelessWidget {
  LoginSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
      bottomNavigationBar: sNavigationBar(
        pageIndicator: PageIndicator.homePage,
      ),
    );
  }
  
  
}

Widget _body(BuildContext context) {
  final logic = Get.put(LoginSignUpPageLogic());
  // logic.setAll(context);
  return Column(
    children: [
      Center(child: Text("kksk"),)
    ],
  );
}
