// ignore_for_file: avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:oua/core/base/view/base_view.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:oua/core/constants/app/app_constants.dart';
import 'package:oua/core/init/theme/app_theme_light.dart';
import 'package:oua/view/map/view_model/map_view_model.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModel: MapViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (context, vm) => Observer(
              builder: (_) {
                return Scaffold(
                    appBar: AppBar(
                      title: Observer(
                        builder: (_) {
                          if (vm.isSearch) {
                            return TextField(
                              controller: vm.searchController,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: _inputdec(context, "Arama"),
                            );
                          } else {
                            return const Text(
                              ApplicationConstants.APP_NAME,
                              style: TextStyle(color: Colors.black),
                            );
                          }
                        },
                      ),
                      centerTitle: true,
                      iconTheme: const IconThemeData(color: Colors.black),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InkWell(
                              onTap: () {
                                vm.searchChange();
                              },
                              child: const Icon(Icons.search)),
                        )
                      ],
                    ),
                    drawer: Observer(builder: (_) {
                      return _mapDrawer(context, vm);
                    }),
                    body: Observer(
                      builder: (_) {
                        return GoogleMap(
                          onMapCreated: vm.onMapCreated,
                          initialCameraPosition: CameraPosition(
                            target: vm.center,
                            zoom: 13.0,
                          ),
                          markers: vm.markerList,
                        );
                      },
                    ));
              },
            ));
  }

  Widget _mapDrawer(BuildContext context, MapViewModel vm) {
    return Column(
      children: [
        Container(
          height: context.height * 0.8,
          color: Colors.amberAccent,
          child: Drawer(
              backgroundColor: AppThemeLight.instance.appColorScheme.surface,
              width: context.width * 0.65,
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppThemeLight.instance.appColorScheme.surface,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(context.width * 0.35),
                        bottomLeft: Radius.circular(context.width * 0.2),
                        bottomRight: Radius.circular(context.width * 0.2)),
                  ),
                  child: Padding(
                    padding: context.verticalPaddingHigh,
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Filtreler",
                              style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        _drawerLine("Vejeteryan", vm.isFilterVejeteryanClicked, vm),
                        _drawerLine("Vegan", vm.isFilterVeganClicked, vm),
                        _drawerLine("Makarna", vm.isFilterMakarnaClicked, vm),
                        _drawerLine("Öğrenciyim", vm.isFilterOgrenciClicked, vm),
                        _drawerLine("İçecek", vm.isFilterIcecekClicked, vm),
                        _drawerLine("Tatlı ", vm.isFilterIcecekClicked, vm),
                        _drawerLine("Hamburger", vm.isFilterHamburgerClicked, vm),
                        _drawerLine("Pizza", vm.isFilterPizzaClicked, vm),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: context.width * 0.52),
                  width: context.width * 0.12,
                  height: context.height * 0.12,
                  decoration: const BoxDecoration(
                      color: Colors.white60,
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(color: Colors.black54, spreadRadius: 1, blurRadius: 2)]),
                  child: Center(child: Icon(Icons.menu, color: AppThemeLight.instance.appColorScheme.surface)),
                ),
              ])),
        ),
      ],
    );
  }

  Widget _drawerLine(String drawerText, bool isClicked, MapViewModel vm) {
    return InkWell(
      onTap: () {
        print(drawerText);
        print(isClicked);
        vm.clickedChaneg(isClicked);
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Icon(
                isClicked ? Icons.radio_button_checked : Icons.radio_button_off,
                color: Colors.white,
              ),
              Text(
                drawerText,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}

InputDecoration _inputdec(BuildContext context, String text) => InputDecoration(
    labelText: text,
    contentPadding: context.paddingLow,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)));
