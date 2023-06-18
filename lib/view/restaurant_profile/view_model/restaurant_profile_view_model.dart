import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:oua/core/base/model/base_view_model.dart';

part 'restaurant_profile_view_model.g.dart';

class RestaurantProfileViewModel = _RestaurantProfileViewModelBase with _$RestaurantProfileViewModel;

abstract class _RestaurantProfileViewModelBase extends BaseViewModel with Store {
  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  void init() {}
}
