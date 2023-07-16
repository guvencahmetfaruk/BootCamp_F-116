// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:oua/core/base/model/base_view_model.dart';
import 'package:oua/core/constants/enums/locale_keys_enum.dart';
import 'package:oua/repository/auth_service.dart';
import 'package:oua/repository/user_service.dart';

import '../../../../core/constants/navigation/navigation_constants.dart';
part 'register_view_model.g.dart';

class RegisterViewModel = _RegisterViewModelBase with _$RegisterViewModel;

abstract class _RegisterViewModelBase extends BaseViewModel with Store {
  @override
  void setContext(BuildContext context) {}
  @override
  void init() {}

  AuthService authService = AuthService();
  UserService userService = UserService();

  TextEditingController mail_controller = TextEditingController();
  TextEditingController password_controller1 = TextEditingController();
  TextEditingController password_controller2 = TextEditingController();
  TextEditingController name_controller = TextEditingController();
  TextEditingController surname_controller = TextEditingController();
  TextEditingController phone_controller = TextEditingController();
  TextEditingController usernName_controller = TextEditingController();

  void navigateToMainFeed() {
    navigation.navigateToPage(path: NavigationConstants.MAINFEED);
  }

  void register() {
    authService.registerWithEmailAndPassword(mail_controller.text, password_controller1.text);
    userService.addUser(
        name_controller.text, surname_controller.text, phone_controller.text, usernName_controller.text);
        
    localeManager.setStringValue(PreferencesKeys.NAME, name_controller.text);
    localeManager.setStringValue(PreferencesKeys.SURNAME, surname_controller.text);
    localeManager.setStringValue(PreferencesKeys.PHONE, phone_controller.text);
    localeManager.setStringValue(PreferencesKeys.USERNAME, usernName_controller.text);
    navigateToMainFeed();
  }
}
