// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:oua/core/base/model/base_view_model.dart';
import 'package:oua/core/constants/navigation/navigation_constants.dart';
import 'package:oua/repository/auth_service.dart';
part 'profile_view_model.g.dart';

class ProfileViewModel = _ProfileViewModelBase with _$ProfileViewModel;

abstract class _ProfileViewModelBase extends BaseViewModel with Store {
  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  void init() {
    isUserLoggedIn();
  }

  final AuthService authService = AuthService();

  @observable
  bool isLoggedIn = false;

  @action
  void isUserLoggedIn() {
    isLoggedIn = authService.checkUserLoggedIn();
  }

  void navigateToLogin() {
    navigation.navigateToPage(path: NavigationConstants.LOGIN);
  }

  void navigateToRegister() {
    navigation.navigateToPage(path: NavigationConstants.REGISTER);
  }

  @action
  void signOut() {
    authService.signOutUser();
    isLoggedIn = false;
  }
}
