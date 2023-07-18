// ignore_for_file: must_be_immutable, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
import 'package:oua/core/base/view/base_view.dart';
import 'package:oua/repository/auth_service.dart';
import 'package:oua/view/profile/view_model/profile_view_model.dart';

import '../../../core/init/theme/app_theme_light.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModel: ProfileViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (context, vm) => Scaffold(
            key: vm.scaffoldKey,
            body: Observer(
              builder: (_) {
                return SafeArea(
                  child: SingleChildScrollView(
                    physics:
                        vm.isLoggedIn ? const AlwaysScrollableScrollPhysics() : const NeverScrollableScrollPhysics(),
                    child: vm.isLoggedIn
                        ? signedProfilePage(context, vm)
                        : unSignedProfilePage(
                            vm: vm,
                          ),
                  ),
                );
              },
            )));
  }

  Column signedProfilePage(BuildContext context, ProfileViewModel vm) {
    return Column(children: [
      Padding(
        padding: context.paddingLow,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             const Text(
              "@username",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                        height: context.height * 0.5,
                        child: SingleChildScrollView(
                            child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: context.height * 0.25,
                                width: context.width * 0.8,
                                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(20)),
                                child: Center(child: Text("Favori restoran ${index +1}",style: const TextStyle(color: Colors.white),)),
                              ),
                            );
                          },
                        )),
                      );
                    });
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Icon(
                Icons.star_outline,
                color: AppThemeLight.instance.appColorScheme.surface,
              ),
            )
          ],
        ),
      ),
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Takip 258"), Text("Takipçi 258")],
          ),
          CircleAvatar(
            minRadius: 50,
            child: Icon(
              Icons.person_outline,
              size: 45,
            ),
          ),
          Text("Puan  1534")
        ],
      ),
      Padding(
        padding: context.paddingLow,
        child: const Center(
          child: Text("Name Surname"),
        ),
      ),
      Padding(
        padding: context.paddingLow,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            ElevatedButton(
                onPressed: () {
                  authService.signOutUser();
                  vm.isLoggedIn = false;
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: Icon(
                  Icons.logout_outlined,
                  color: AppThemeLight.instance.appColorScheme.surface,
                )),
          ],
        ),
      ),
      const Divider(thickness: 3),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.black,
              width: context.width * 0.2,
              height: context.height * 0.1,
              child: Center(child: Text("${index +1}",style: const TextStyle(color: Colors.white),),),
            );
          },
        ),
      )
    ]);
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
            onPressed: () {
              vm.navigateToRegister();
            },
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
