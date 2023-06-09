// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oua/core/constants/image/image_constants.dart';

import '../../../core/base/model/base_view_model.dart';
part 'map_view_model.g.dart';

class MapViewModel = _MapViewModelBase with _$MapViewModel;

abstract class _MapViewModelBase extends BaseViewModel with Store {
  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  void init() {
    intializeIcon();
    addMarker(marker);
    addMarker(marker1);
  }

  Future<void> intializeIcon() async {
    myIcon = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), ImageConstants.instance.starMarker);
  }

  List filterList = ["Vejeteryan", "Vegan", "Makarna", "Öğrenci", "İçecek", "Tatlı", "Hamburger", "Pizza"];

  @observable
  List<bool> isClickedList = [false, false, false, false, false, false, false, false];

  @observable
  late GoogleMapController mapController;
  final LatLng center = const LatLng(41.075781, 28.961359);
  @observable
  late BitmapDescriptor myIcon;
  @observable
  Set<Marker> markerList = {};
  @observable
  TextEditingController searchController = TextEditingController();
  @observable
  bool isSearch = false;

  final marker = const Marker(
      markerId: MarkerId("ev"),
      position: LatLng(41.075781, 28.961359),
      // icon: myIcon,
      infoWindow: InfoWindow(title: "Ev", snippet: "evimin adresi"));
  final marker1 = const Marker(
      markerId: MarkerId("ev"),
      position: LatLng(41.075777, 28.961344),
      // icon: myIcon,
      infoWindow: InfoWindow(title: "Ev", snippet: "evimin adresi"));

  @action
  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @action
  void addMarker(Marker marker) {
    markerList.add(marker);
  }

  @action
  void searchChange() {
    isSearch = !isSearch;
  }

  @action
  void changeClick(int index) {
    isClickedList[index] = !isClickedList[index];
  }
}
