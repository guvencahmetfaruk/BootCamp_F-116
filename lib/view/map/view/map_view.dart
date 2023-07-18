// ignore_for_file: avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:oua/core/base/view/base_view.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:oua/core/constants/app/app_constants.dart';
import 'package:oua/core/init/theme/app_theme_light.dart';
import 'package:oua/view/map/view_model/map_view_model.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

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
            drawer: _mapDrawer(context, vm),
            body: Observer(
              builder: (_) {
                if (vm.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return SlidingUpPanel(
                    controller: vm.panelController,
                    backdropTapClosesPanel: true,
                    panel: Observer(builder: (_) {
                      if (vm.resName == "") {
                        return Container();
                      } else {
                        return _bottomSheetMenu(vm, context);
                      }
                    }),
                    body: GoogleMap(
                      onMapCreated: vm.onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: vm.center,
                        zoom: 10.0,
                      ),
                      markers: vm.markerList,
                      mapType: MapType.hybrid,
                    ),
                  );
                }
              },
            )));
  }

  Widget _bottomSheetMenu(MapViewModel vm, BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: context.width * 0.01),
                child: Container(
                  decoration:  BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppThemeLight.instance.appColorScheme.surface, // Mavi doldurma rengi
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.food_bank,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16.0),
              Padding(
                padding: EdgeInsets.only(top: context.height * 0.01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'İşletme İsmi:',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      vm.resName.toCapitalized(),
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const Text(
                      'Puanı: 10/10',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const Text(
                      'Değerlendirme Sayısı: 5504',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const Text(
                      'Yorum Sayısı: 0455',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(right: context.width * 0.01, top: context.height * 0.01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        vm.redirectMap(vm.lat, vm.lon);
                      },
                      child: Container(
                        width: context.width * 0.25,
                        height: context.height * .05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppThemeLight.instance.appColorScheme.surface,
                        ),
                        child: const Center(
                          child: Text(
                            'Yol Tarifi Al',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    InkWell(
                      onTap: () {
                        // Rezervasyon yap butonuna tıklandığında gerçekleştirilecek işlemler
                      },
                      child: Container(
                        width: context.width * 0.25,
                        height: context.height * .05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppThemeLight.instance.appColorScheme.surface,
                        ),
                        child: const Center(
                          child: Text(
                            'Rezervasyon Yap',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    // Ürün resimleri ve fiyatları butonuna tıklandığında gerçekleştirilecek işlemler
                  },
                  child: Container(
                    height: context.height * 0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppThemeLight.instance.appColorScheme.surface,
                    ),
                    child: const Center(
                      child: Text(
                        'Ürün Resimleri ve Fiyatları',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: InkWell(
                  onTap: () {
                    print("Favorilere Eklendi");
                  },
                  child: Container(
                    height: context.height * 0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppThemeLight.instance.appColorScheme.surface,
                    ),
                    child: const Center(
                      child: Text(
                        'Favorilere Ekle',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            height: context.height * 0.37,
            child: SingleChildScrollView(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: vm.urunFiyat.length,
                itemBuilder: (context, index) {
                  String urun = vm.urunFiyat.keys.elementAt(index);
                  dynamic fiyat = vm.urunFiyat[urun];
                  String resim = vm.urunResim[urun];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: context.width * 0.8,
                            height: context.height * 0.2,
                            child: Image.network(resim, fit: BoxFit.cover)),
                        Text(
                          urun.toCapitalized(),
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text("${fiyat.toString()} TL", style: const TextStyle(fontSize: 15)),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
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
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: vm.filterList.length,
                          itemBuilder: (context, index) {
                            return _drawerLine(vm.filterList[index], vm.isClickedList[index], vm, index);
                          },
                        )
                      ],
                    ),
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.only(left: context.width * 0.52, top: context.width * 0.08),
                //   width: context.width * 0.12,
                //   height: context.height * 0.10,
                //   decoration: const BoxDecoration(
                //       color: Colors.white60,
                //       shape: BoxShape.circle,
                //       boxShadow: [BoxShadow(color: Colors.black54, spreadRadius: 1, blurRadius: 2)]),
                //   child: Center(child: Icon(Icons.menu, color: AppThemeLight.instance.appColorScheme.surface)),
                // ),
              ])),
        ),
      ],
    );
  }

  Widget _drawerLine(String drawerText, bool isClicked, MapViewModel vm, int index) {
    return Observer(builder: (_) {
      return InkWell(
        onTap: () {
          vm.changeClick(index);
        },
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(
                  vm.isClickedList[index] ? Icons.radio_button_checked : Icons.radio_button_off,
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
    });
  }
}

InputDecoration _inputdec(BuildContext context, String text) => InputDecoration(
    labelText: text,
    contentPadding: context.paddingLow,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)));
