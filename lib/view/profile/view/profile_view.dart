// ignore_for_file: must_be_immutable, camel_case_types

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:oua/core/base/view/base_view.dart';
import 'package:oua/core/constants/app/app_constants.dart';
import 'package:oua/view/profile/view_model/profile_view_model.dart';

import '../../../core/init/theme/app_theme_light.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModel: ProfileViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (context, vm) => Scaffold(
              appBar: AppBar(
                  centerTitle: true,
                  title: const Text(ApplicationConstants.APP_NAME, style: TextStyle(color: Colors.black))),
              body: unSignedProfilePage(vm: vm),
            ));
  }
}

class unSignedProfilePage extends StatelessWidget {
  unSignedProfilePage({super.key, required this.vm});

  ProfileViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: context.height * 0.3),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          ElevatedButton(
            onPressed: () {
              vm.navigateToLogin();
            },
            style: ElevatedButton.styleFrom(
                minimumSize: Size(context.width * 0.8, context.height * 0.05),
                backgroundColor: AppThemeLight.instance.appColorScheme.surface),
            child: const Text("Giriş Yap"),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                minimumSize: Size(context.width * 0.8, context.height * 0.05),
                backgroundColor: AppThemeLight.instance.appColorScheme.surface),
            child: const Text("Kayıt Ol"),
          ),
        ]),
      ),
    );
  }
}
