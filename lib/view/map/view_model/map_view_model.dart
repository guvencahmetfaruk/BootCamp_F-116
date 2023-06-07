import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/base/model/base_view_model.dart';
part 'map_view_model.g.dart';

class MapViewModel = _MapViewModelBase with _$MapViewModel;

abstract class _MapViewModelBase extends BaseViewModel with Store {
  @override
  void setContext(BuildContext context) {}
  @override
  void init() {}

  late GoogleMapController mapController;
  final LatLng center = const LatLng(41.075781, 28.961359);

  final marker = const Marker(
      markerId: MarkerId("ev"),
      position: LatLng(41.075781, 28.961359),
      infoWindow: InfoWindow(title: "Ev", snippet: "evimin adresi"));

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
}
