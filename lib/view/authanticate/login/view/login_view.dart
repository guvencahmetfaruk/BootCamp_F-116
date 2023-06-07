import 'package:flutter/material.dart';
import 'package:oua/core/base/view/base_view.dart';
import 'package:oua/view/authanticate/login/view_model/login_view_model.dart';
import 'package:kartal/kartal.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModel: LoginViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, LoginViewModel vm) => Scaffold(
              appBar: AppBar(),
              key: vm.formState,
              body: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: context.verticalPaddingNormal,
                        child: _inputMail(vm, context),
                      ),
                      Padding(
                        padding: context.verticalPaddingNormal,
                        child: _inputPassword(vm, context),
                      ),
                      Padding(
                        padding: context.onlyTopPaddingMedium,
                        child: _buttonLogin(context),
                      ),
                      Padding(
                        padding: context.onlyTopPaddingMedium,
                        child: _buttonDevam(context, vm),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }

  Container _buttonDevam(BuildContext context, LoginViewModel vm) {
    return Container(
        width: context.width * 0.7,
        height: context.height * 0.06,
        decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(15)),
        child: ElevatedButton(
          onPressed: () {
            vm.navigateToMainFeed();
          },
          style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
          child: const Text("Giriş Yapmadan Devam Et"),
        ));
  }

  Container _buttonLogin(BuildContext context) {
    return Container(
        width: context.width * 0.7,
        height: context.height * 0.06,
        decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(15)),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
          child: const Text("Giriş Yap"),
        ));
  }

  TextFormField _inputPassword(LoginViewModel vm, BuildContext context) {
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

  TextFormField _inputMail(LoginViewModel vm, BuildContext context) {
    return TextFormField(
      controller: vm.mail_controller,
      keyboardType: TextInputType.emailAddress,
      decoration: _inputdec(context, "Email"),
    );
  }
}

InputDecoration _inputdec(BuildContext context, String text) =>
    InputDecoration(labelText: text, contentPadding: context.paddingLow);
