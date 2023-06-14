import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:oua/core/base/model/base_view_model.dart';
part 'register_view_model.g.dart';

class RegisterViewModel = _RegisterViewModelBase with _$RegisterViewModel;

abstract class _RegisterViewModelBase extends BaseViewModel with Store {
  @override
  void setContext(BuildContext context) {}
  @override
  void init() {}
}
