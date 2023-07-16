// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oua/core/constants/image/image_constants.dart';
import 'package:oua/repository/restaurant_service.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../Util/MapUtil.dart';
import '../../../core/base/model/base_view_model.dart';
part 'map_view_model.g.dart';

class MapViewModel = _MapViewModelBase with _$MapViewModel;

abstract class _MapViewModelBase extends BaseViewModel with Store {
  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  void init() {
    intializeIcon();
    _loadRestaurants();
  }

  Future<void> intializeIcon() async {
    myIcon = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), ImageConstants.instance.starMarker);
  }

  final RestaurantService restaurantService = RestaurantService();
  @observable
  List<DocumentSnapshot> restaurants = [];

  @observable
  bool isLoading = false;

  List filterList = ["Vejeteryan", "Vegan", "Makarna", "Öğrenci", "İçecek", "Tatlı", "Hamburger", "Pizza"];

  @observable
  List<bool> isClickedList = [false, false, false, false, false, false, false, false];

  @observable
  late GoogleMapController mapController;
  final LatLng center = const LatLng(41.0811956, 28.9555549);
  @observable
  late BitmapDescriptor myIcon;
  @observable
  Set<Marker> markerList = {};
  @observable
  TextEditingController searchController = TextEditingController();
  @observable
  bool isSearch = false;
  @observable
  bool isRestaurantInfoVisible = false;

  @observable
  String resName = "";

  @observable
  Map<String, dynamic> urunFiyat = {};
  @observable
  Map<String, dynamic> urunResim = {};
  @observable
  double lat = 0;
  @observable
  double lon = 0;

  @observable
  PanelController panelController = PanelController();

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

  Future<void> _loadRestaurants() async {
    loadingChange();
    List<DocumentSnapshot> restaurantsList = await restaurantService.getRestaurants();
    restaurants = restaurantsList;
    for (final i in restaurants) {
      print("AAAAAAAAAAAAAAAAAAAAA");
      final data = i.data()! as Map<String, dynamic>;
      print(data);
      addMarker(Marker(
          markerId: MarkerId(data["name"]),
          position: LatLng(data["latitude"], data["longitude"]),
          onTap: () {
            resName = data["name"];
            urunFiyat = data["ürünFiyat"];
            urunResim = data["ürünResim"];
            lat = data["latitude"];
            lon = data["longitude"];
          },
          infoWindow: InfoWindow(title: data["name"], snippet: data["description"])));
    }
    loadingChange();
  }

  void loadingChange() {
    print("isloadingchange");
    isLoading = !isLoading;
  }

  @action
  void redirectMap(lat, lon) {
    MapUtils.openMap(lat, lon);
  }
}
