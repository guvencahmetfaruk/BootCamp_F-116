// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
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
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _title(),
                      const SizedBox(height: 20.0),
                      _userName(vm),
                      const SizedBox(height: 10.0),
                      _nameSurname(vm),
                      const SizedBox(height: 10.0),
                      _email(vm),
                      const SizedBox(height: 10.0),
                      _phoneNumber(vm),
                      const SizedBox(height: 10.0),
                      _password1(vm),
                      const SizedBox(height: 10.0),
                      _password2(vm),
                      const SizedBox(height: 20.0),
                      _button(context, vm),
                    ],
                  ),
                ),
              ),
            ));
  }

  Row _email(RegisterViewModel vm) {
    return Row(
      children: [
        const Expanded(flex: 1, child: Icon(Icons.email)),
        Expanded(
            flex: 9,
            child: TextField(
              controller: vm.mail_controller,
              decoration: const InputDecoration(labelText: "Email"),
            ))
      ],
    );
  }

  Container _button(BuildContext context, RegisterViewModel vm) {
    return Container(
      width: 200.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: AppThemeLight.instance.appColorScheme.surface, // Elips butonun rengi
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: ElevatedButton(
        onPressed: () {
          if (vm.mail_controller.text == "" &&
              vm.password_controller1.text == "" &&
              vm.password_controller2.text == "" &&
              vm.name_controller.text == "" &&
              vm.surname_controller.text == "" &&
              vm.phone_controller.text == "") {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Lütfen boş alanları doldurunuz")));
          } else {
            if (vm.password_controller1.text == vm.password_controller2.text) {
              vm.register();
            } else {
              print(vm.password_controller1.text);
              print(vm.password_controller2.text);
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Girdiğiniz şifreler eşleşmiyor")));
            }
          }
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          backgroundColor: AppThemeLight.instance.appColorScheme.surface, // Elips butonun rengi
        ),
        child: const Text(
          'KAYIT OL',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white, // En alttaki Kayıt Ol yazısının rengi
          ),
        ),
      ),
    );
  }

  Row _password2(RegisterViewModel vm) {
    return Row(
      children: [
        const Expanded(
          flex: 1,
          child: Icon(Icons.lock),
        ),
        Expanded(
          flex: 9,
          child: TextField(
            controller: vm.password_controller2,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Şifre Tekrar:',
            ),
          ),
        ),
      ],
    );
  }

  Row _password1(RegisterViewModel vm) {
    return Row(
      children: [
        const Expanded(
          flex: 1,
          child: Icon(Icons.lock),
        ),
        Expanded(
          flex: 9,
          child: TextField(
            controller: vm.password_controller1,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Şifre:',
            ),
          ),
        ),
      ],
    );
  }

  Row _phoneNumber(RegisterViewModel vm) {
    return Row(
      children: [
        const Expanded(
          flex: 1,
          child: Icon(Icons.phone),
        ),
        Expanded(
          flex: 9,
          child: TextField(
            controller: vm.phone_controller,
            decoration: const InputDecoration(
              labelText: 'Telefon Numarası:',
            ),
          ),
        ),
      ],
    );
  }

  Row _nameSurname(RegisterViewModel vm) {
    return Row(
      children: [
        const Expanded(
          flex: 1,
          child: Icon(Icons.person),
        ),
        Expanded(
          flex: 4,
          child: TextField(
            controller: vm.name_controller,
            decoration: const InputDecoration(
              labelText: 'İsim:',
            ),
          ),
        ),
        const Expanded(
          flex: 1,
          child: Icon(Icons.person),
        ),
        Expanded(
          flex: 4,
          child: TextField(
            controller: vm.surname_controller,
            decoration: const InputDecoration(
              labelText: 'Soyisim:',
            ),
          ),
        ),
      ],
    );
  }

  Row _userName(RegisterViewModel vm) {
    return Row(
      children: [
        const Expanded(
          flex: 1,
          child: Icon(Icons.person),
        ),
        Expanded(
          flex: 9,
          child: TextField(
            controller: vm.usernName_controller,
            decoration: const InputDecoration(
              labelText: 'Kullanıcı Adı:',
            ),
          ),
        ),
      ],
    );
  }

  Row _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.person_add,
          color: AppThemeLight.instance.appColorScheme.surface, // Kayıt ol ikonunun rengi
        ),
        const SizedBox(width: 10.0),
        Text(
          'KAYIT OL',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
            color: AppThemeLight.instance.appColorScheme.surface, // En üstteki Kayıt Ol yazısının rengi
          ),
        ),
      ],
    );
  }
}
