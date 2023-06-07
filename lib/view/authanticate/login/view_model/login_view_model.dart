// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:oua/core/constants/navigation/navigation_constants.dart';

import '../../../../core/base/model/base_view_model.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase extends BaseViewModel with Store {
  @override
  void setContext(BuildContext context) {}
  @override
  void init() {}

  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController mail_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();

  void navigateToMainFeed() {
    navigation.navigateToPage(path: NavigationConstants.MAINFEED);
  }
}
