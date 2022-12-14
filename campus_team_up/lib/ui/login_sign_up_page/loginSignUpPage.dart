import 'package:campus_team_up/ui/login_sign_up_page/LoginSignUpPageLogic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class LoginSignUpPage extends StatelessWidget {
  LoginSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(LoginSignUpPageLogic());
    return Scaffold(body: _body(context));
  }
}

Widget _body(BuildContext context) {
  final logic = Get.put(LoginSignUpPageLogic());
  if (!logic.inited) {
    logic.setUpStates(Get.currentRoute, context);
  }
  return Stack(
    children: [
      //TODO 夜间模式？
      _backGround(),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.people,
              size: 99,
            ),
            _form(logic),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _loginSignUpHint(logic),
              ],
            )
          ],
        ),
      ),
      Positioned(
        bottom: MediaQuery.of(context).size.width * 0.05,
        right: MediaQuery.of(context).size.height * 0.05,
        child: _versionInfo(),
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

Widget _form(LoginSignUpPageLogic logic) {
  return FormBuilder(
    key: logic.formKey,
    child: Column(children: [
      Row(
        children: [
          Text('userAccount'),
          Expanded(
            child: FormBuilderTextField(
              name: 'userAccount',
              // decoration: const InputDecoration(labelText: 'Email'),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.email(),
              ]),
            ),
          ),
        ],
      ),
      Row(
        children: [
          Text('userPwd'),
          Expanded(
            child: GetBuilder<LoginSignUpPageLogic>(
              builder: (_logic) => FormBuilderTextField(
                name: 'userPwd',
                obscureText: !_logic.textVisibility,
                keyboardType: TextInputType.visiblePassword,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                  icon: _logic.textVisibility
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                  onPressed: () => {_logic.switchTextVisibility()},
                )),
              ),
            ),
          ),
        ],
      ),
      if (logic.showCaptcha)
        Row(
          children: [
            Text('captcha'),
            Expanded(
              child: FormBuilderTextField(
                name: 'captcha',
              ),
            ),
          ],
        ),
      ElevatedButton(
          onPressed: () {
            bool? validation = logic.formKey.currentState?.validate();

            //DEBUG BEGIN
            // validation = true;
            //DEBUG END

            //  if(await checkUserExist()){
            // logic.formKey.currentState?.invalidateField(
            //     name: 'userAccount', errorText: 'user not exist.');
            
            // if (validation == true) {
            //   Get.offAllNamed('/signUp');
            // }

            //     ?.invalidate('Email already taken');
          },
          child: Text(logic.buttonText)),
    ]),
  );
}

Widget _loginSignUpHint(LoginSignUpPageLogic logic) {
  return TextButton(
      onPressed: () {
        Get.offAllNamed(logic.switchRoute);
      },
      child: Text(logic.switchText));
}

Widget _versionInfo() {
  return Text('ybyb 1.0');
}
