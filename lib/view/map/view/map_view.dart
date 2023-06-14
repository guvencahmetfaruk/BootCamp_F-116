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
        onPageBuilder: (context, vm) => Scaffold(
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
            drawer: _mapDrawer(context),
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
            )));
  }

  Widget _mapDrawer(BuildContext context) {
    return Column(
      children: [
        Container(
          height: context.height * 0.8,
          color: Colors.amberAccent,
          child: Drawer(
              width: context.width * 0.65,
              child: Container(
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
                      _drawerLine("Vejeteryan"),
                      _drawerLine("Vegan"),
                      _drawerLine("Makarna"),
                      _drawerLine("Öğrenciyim"),
                      _drawerLine("İçecek"),
                      _drawerLine("Tatlı "),
                      _drawerLine("Hamburger"),
                      _drawerLine("Pizza"),
                    ],
                  ),
                ),
              )),
        ),
      ],
    );
  }

  Padding _drawerLine(String drawerText) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          const Icon(
            Icons.check_box_outline_blank,
            color: Colors.white,
          ),
          Text(
            drawerText,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          )
        ],
      ),
    );
  }
}

InputDecoration _inputdec(BuildContext context, String text) => InputDecoration(
    labelText: text,
    contentPadding: context.paddingLow,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)));
