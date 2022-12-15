import 'package:campus_team_up/ui/gradient_background/gradient_background.dart';
import 'package:campus_team_up/ui/login_sign_up_page/LoginSignUpPageLogic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginSignUpPage extends StatelessWidget {
  LoginSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(LoginSignUpPageLogic());
    if (!logic.inited) {
      logic.setUpStates(Get.currentRoute, context);
    }
    return GradientBackground(
      body: _body(context),
      whited: false,
    );
  }
}

Widget _body(BuildContext context) {
  final logic = Get.find<LoginSignUpPageLogic>();
  return Stack(
    children: [
      //TODO 夜间模式？
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<LoginSignUpPageLogic>(
              builder: (_logic) => Icon(
                _logic.icon,
                size: 99,
              ),
            ),
            SingleChildScrollView(child: _form(logic, context)),
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
        child: _versionInfo(context),
      ),
    ],
  );
}

Widget _form(LoginSignUpPageLogic logic, BuildContext context) {
  return FormBuilder(
    key: logic.logicFormKey,
    child: Column(children: [
      Row(
        children: [
          Text(AppLocalizations.of(context).account),
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
          Text(AppLocalizations.of(context).password),
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
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
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
            Text(AppLocalizations.of(context).verification_code),
            Expanded(
              child: FormBuilderTextField(
                name: 'captcha',
              ),
            ),
          ],
        ),
      ElevatedButton(
          style: ButtonStyle(
              shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.white)))),
          onPressed: () {
            bool? validation = logic.logicFormKey.currentState?.validate();

            //DEBUG BEGIN
            validation = true;
            //DEBUG END

            //  if(await checkUserExist()){
            // logic.formKey.currentState?.invalidateField(
            //     name: 'userAccount', errorText: 'user not exist.');

            if (validation == true) {
              Get.offAllNamed('/discovery');
            }

            //     ?.invalidate('Email already taken');
          },
          child: Text(logic.buttonText)),
    ]),
  );
}

Widget _loginSignUpHint(LoginSignUpPageLogic logic) {
  return TextButton(
      onPressed: () async {
        //TODO make sure softkeyboard dismissd, ortherwise will gobalkey duplicate
        FocusManager.instance.primaryFocus?.unfocus();
        await Future.delayed(Duration(milliseconds: 200));

        Get.offNamed('${logic.switchRoute}');
      },
      child: Text(logic.switchText));
}

Widget _versionInfo(BuildContext context) {
  return Text('${AppLocalizations.of(context).campus_team_up_version} 1.0');
}
