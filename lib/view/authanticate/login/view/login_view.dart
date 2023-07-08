import 'package:flutter/material.dart';
import 'package:oua/core/base/view/base_view.dart';
import 'package:oua/core/init/theme/app_theme_light.dart';
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
              key: vm.formState,
              body: SafeArea(
                child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.only(top: context.height * 0.15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _girisYapText(),
                          Text(
                            "Kullanıcı Adı ve Şifren ile Giriş Yap",
                            style: TextStyle(color: AppThemeLight.instance.appColorScheme.surface),
                          ),
                          _kullaniciAdiTextField(context, vm),
                          _sifreTextField(context, vm),
                          _girisYapButton(context, vm),
                          _kayitOl(context, vm),
                        ],
                      ),
                    )),
              ),
            ));
  }

  Padding _kayitOl(BuildContext context, LoginViewModel vm) {
    return Padding(
      padding: EdgeInsets.only(top: context.height * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Hesap Oluştumradın Mı?",
            style: TextStyle(color: AppThemeLight.instance.appColorScheme.surface),
          ),
          InkWell(
            onTap: () {
              vm.navigateToMRegister();
            },
            child: Text(
              "Hemen Kayıt Ol!",
              style: TextStyle(color: AppThemeLight.instance.appColorScheme.surface, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Padding _girisYapButton(BuildContext context, LoginViewModel vm) {
    return Padding(
      padding: EdgeInsets.only(top: context.height * 0.05),
      child: InkWell(
        onTap: () async {
          var value = await vm.signIn(vm.mail_controller.text, vm.password_controller.text);
          if (value) {
            vm.navigateToMainFeed();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Bilgileriniz Yanlış")));
          }
        },
        child: Container(
          width: context.width * 0.4,
          height: context.height * 0.05,
          decoration: BoxDecoration(
              color: AppThemeLight.instance.appColorScheme.surface,
              borderRadius: const BorderRadius.all(Radius.circular(100))),
          child: const Center(
              child: Text(
            "Giriş Yap",
            style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }

  Padding _sifreTextField(BuildContext context, LoginViewModel vm) {
    return Padding(
      padding: EdgeInsets.only(top: context.width * 0.1),
      child: SizedBox(
        width: context.width,
        child: Padding(
          padding: EdgeInsets.only(left: context.width * 0.1, right: context.width * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Şifre:",
                textAlign: TextAlign.start,
                style: TextStyle(color: AppThemeLight.instance.appColorScheme.surface),
              ),
              TextField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                controller: vm.password_controller,
                decoration: InputDecoration(
                    iconColor: AppThemeLight.instance.appColorScheme.surface,
                    icon: const Icon(Icons.lock),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppThemeLight.instance.appColorScheme.surface))),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding _kullaniciAdiTextField(BuildContext context, LoginViewModel vm) {
    return Padding(
      padding: EdgeInsets.only(top: context.width * 0.1),
      child: SizedBox(
        width: context.width,
        child: Padding(
          padding: EdgeInsets.only(left: context.width * 0.1, right: context.width * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Email:",
                textAlign: TextAlign.start,
                style: TextStyle(color: AppThemeLight.instance.appColorScheme.surface),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: vm.mail_controller,
                decoration: InputDecoration(
                    iconColor: AppThemeLight.instance.appColorScheme.surface,
                    icon: const Icon(Icons.person),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppThemeLight.instance.appColorScheme.surface))),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row _girisYapText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.key,
          color: AppThemeLight.instance.appColorScheme.surface,
          size: 45,
        ),
        Text(
          "Giriş Yap",
          style: TextStyle(
              fontSize: 30, color: AppThemeLight.instance.appColorScheme.surface, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Container _buttonLogin(BuildContext context, LoginViewModel vm) {
    return Container(
        width: context.width * 0.7,
        height: context.height * 0.06,
        decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(15)),
        child: ElevatedButton(
          onPressed: () async {
            var value = await vm.signIn(vm.mail_controller.text, vm.password_controller.text);
            if (value) {
              vm.navigateToMainFeed();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Bilgileriniz Yanlış")));
            }
          },
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              backgroundColor: AppThemeLight.instance.appColorScheme.surface),
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
