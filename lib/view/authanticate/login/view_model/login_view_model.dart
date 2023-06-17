// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:oua/core/constants/navigation/navigation_constants.dart';
import 'package:oua/repository/auth_service.dart';

import '../../../../core/base/model/base_view_model.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase extends BaseViewModel with Store {
  @override
  void setContext(BuildContext context) {}
  @override
  void init() {}

  final AuthService authService = AuthService();

  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController mail_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();

  void navigateToMainFeed() {
    navigation.navigateToPage(path: NavigationConstants.MAINFEED);
  }

  @action
  Future<bool> signIn(String email, String password) async {
    return await authService.signInUser(email, password);
  }
}
