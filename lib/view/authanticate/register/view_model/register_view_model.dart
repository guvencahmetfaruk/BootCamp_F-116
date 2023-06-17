// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:oua/core/base/model/base_view_model.dart';

import '../../../../core/constants/navigation/navigation_constants.dart';
part 'register_view_model.g.dart';

class RegisterViewModel = _RegisterViewModelBase with _$RegisterViewModel;

abstract class _RegisterViewModelBase extends BaseViewModel with Store {
  @override
  void setContext(BuildContext context) {}
  @override
  void init() {}

  TextEditingController mail_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  void navigateToMainFeed() {
    navigation.navigateToPage(path: NavigationConstants.MAINFEED);
  }
}
