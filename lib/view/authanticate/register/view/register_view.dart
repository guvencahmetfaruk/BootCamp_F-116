// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:oua/core/base/view/base_view.dart';
import 'package:oua/repository/auth_service.dart';

import '../../../../core/init/theme/app_theme_light.dart';
import '../view_model/register_view_model.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  AuthService service = AuthService();

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModel: RegisterViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, RegisterViewModel vm) => Scaffold(
              appBar: AppBar(),
              body: Padding(
                padding: context.paddingMedium,
                child: Column(children: [
                  Padding(
                    padding: context.verticalPaddingNormal,
                    child: _inputMail(vm, context),
                  ),
                  Padding(
                    padding: context.verticalPaddingNormal,
                    child: _inputPassword(vm, context),
                  ),
                  Padding(
                    padding: context.verticalPaddingNormal,
                    child: _buttonLogin(context, vm),
                  ),
                ]),
              ),
            ));
  }

  TextFormField _inputMail(RegisterViewModel vm, BuildContext context) {
    return TextFormField(
      controller: vm.mail_controller,
      keyboardType: TextInputType.emailAddress,
      decoration: _inputdec(context, "Email"),
    );
  }

  TextFormField _inputPassword(RegisterViewModel vm, BuildContext context) {
    return TextFormField(
      controller: vm.password_controller,
      keyboardType: TextInputType.visiblePassword,
      decoration: _inputdec(context, "Şifre"),
      validator: (value) {
        if (value!.isEmpty) {
          return "Güçlü Bir Şifre Giriniz";
        }
        return null;
      },
      obscureText: true,
    );
  }

  Container _buttonLogin(BuildContext context, RegisterViewModel vm) {
    return Container(
        width: context.width * 0.7,
        height: context.height * 0.06,
        decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(15)),
        child: ElevatedButton(
          onPressed: () async {
            bool isRegister =
                await service.registerWithEmailAndPassword(vm.mail_controller.text, vm.password_controller.text);
            if (isRegister) {
              vm.navigateToMainFeed();
            }
          },
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              backgroundColor: AppThemeLight.instance.appColorScheme.surface),
          child: const Text("Kayıt Ol"),
        ));
  }
}

InputDecoration _inputdec(BuildContext context, String text) =>
    InputDecoration(labelText: text, contentPadding: context.paddingLow);
