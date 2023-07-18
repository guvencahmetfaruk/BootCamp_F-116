// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MapViewModel on _MapViewModelBase, Store {
  late final _$restaurantsAtom =
      Atom(name: '_MapViewModelBase.restaurants', context: context);

  @override
  List<DocumentSnapshot<Object?>> get restaurants {
    _$restaurantsAtom.reportRead();
    return super.restaurants;
  }

  @override
  set restaurants(List<DocumentSnapshot<Object?>> value) {
    _$restaurantsAtom.reportWrite(value, super.restaurants, () {
      super.restaurants = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_MapViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isClickedListAtom =
      Atom(name: '_MapViewModelBase.isClickedList', context: context);

  @override
  List<bool> get isClickedList {
    _$isClickedListAtom.reportRead();
    return super.isClickedList;
  }

  @override
  set isClickedList(List<bool> value) {
    _$isClickedListAtom.reportWrite(value, super.isClickedList, () {
      super.isClickedList = value;
    });
  }

  late final _$mapControllerAtom =
      Atom(name: '_MapViewModelBase.mapController', context: context);

  @override
  GoogleMapController get mapController {
    _$mapControllerAtom.reportRead();
    return super.mapController;
  }

  @override
  set mapController(GoogleMapController value) {
    _$mapControllerAtom.reportWrite(value, super.mapController, () {
      super.mapController = value;
    });
  }

  late final _$myIconAtom =
      Atom(name: '_MapViewModelBase.myIcon', context: context);

  @override
  BitmapDescriptor get myIcon {
    _$myIconAtom.reportRead();
    return super.myIcon;
  }

  @override
  set myIcon(BitmapDescriptor value) {
    _$myIconAtom.reportWrite(value, super.myIcon, () {
      super.myIcon = value;
    });
  }

  late final _$markerListAtom =
      Atom(name: '_MapViewModelBase.markerList', context: context);

  @override
  Set<Marker> get markerList {
    _$markerListAtom.reportRead();
    return super.markerList;
  }

  @override
  set markerList(Set<Marker> value) {
    _$markerListAtom.reportWrite(value, super.markerList, () {
      super.markerList = value;
    });
  }

  late final _$searchControllerAtom =
      Atom(name: '_MapViewModelBase.searchController', context: context);

  @override
  TextEditingController get searchController {
    _$searchControllerAtom.reportRead();
    return super.searchController;
  }

  @override
  set searchController(TextEditingController value) {
    _$searchControllerAtom.reportWrite(value, super.searchController, () {
      super.searchController = value;
    });
  }

  late final _$isSearchAtom =
      Atom(name: '_MapViewModelBase.isSearch', context: context);

  @override
  bool get isSearch {
    _$isSearchAtom.reportRead();
    return super.isSearch;
  }

  @override
  set isSearch(bool value) {
    _$isSearchAtom.reportWrite(value, super.isSearch, () {
      super.isSearch = value;
    });
  }

  late final _$isRestaurantInfoVisibleAtom =
      Atom(name: '_MapViewModelBase.isRestaurantInfoVisible', context: context);

  @override
  bool get isRestaurantInfoVisible {
    _$isRestaurantInfoVisibleAtom.reportRead();
    return super.isRestaurantInfoVisible;
  }

  @override
  set isRestaurantInfoVisible(bool value) {
    _$isRestaurantInfoVisibleAtom
        .reportWrite(value, super.isRestaurantInfoVisible, () {
      super.isRestaurantInfoVisible = value;
    });
  }

  late final _$resNameAtom =
      Atom(name: '_MapViewModelBase.resName', context: context);

  @override
  String get resName {
    _$resNameAtom.reportRead();
    return super.resName;
  }

  @override
  set resName(String value) {
    _$resNameAtom.reportWrite(value, super.resName, () {
      super.resName = value;
    });
  }

  late final _$urunFiyatAtom =
      Atom(name: '_MapViewModelBase.urunFiyat', context: context);

  @override
  Map<String, dynamic> get urunFiyat {
    _$urunFiyatAtom.reportRead();
    return super.urunFiyat;
  }

  @override
  set urunFiyat(Map<String, dynamic> value) {
    _$urunFiyatAtom.reportWrite(value, super.urunFiyat, () {
      super.urunFiyat = value;
    });
  }

  late final _$urunResimAtom =
      Atom(name: '_MapViewModelBase.urunResim', context: context);

  @override
  Map<String, dynamic> get urunResim {
    _$urunResimAtom.reportRead();
    return super.urunResim;
  }

  @override
  set urunResim(Map<String, dynamic> value) {
    _$urunResimAtom.reportWrite(value, super.urunResim, () {
      super.urunResim = value;
    });
  }

  late final _$panelControllerAtom =
      Atom(name: '_MapViewModelBase.panelController', context: context);

  @override
  PanelController get panelController {
    _$panelControllerAtom.reportRead();
    return super.panelController;
  }

  @override
  set panelController(PanelController value) {
    _$panelControllerAtom.reportWrite(value, super.panelController, () {
      super.panelController = value;
    });
  }

  late final _$_MapViewModelBaseActionController =
      ActionController(name: '_MapViewModelBase', context: context);

  @override
  void onMapCreated(GoogleMapController controller) {
    final _$actionInfo = _$_MapViewModelBaseActionController.startAction(
        name: '_MapViewModelBase.onMapCreated');
    try {
      return super.onMapCreated(controller);
    } finally {
      _$_MapViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addMarker(Marker marker) {
    final _$actionInfo = _$_MapViewModelBaseActionController.startAction(
        name: '_MapViewModelBase.addMarker');
    try {
      return super.addMarker(marker);
    } finally {
      _$_MapViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchChange() {
    final _$actionInfo = _$_MapViewModelBaseActionController.startAction(
        name: '_MapViewModelBase.searchChange');
    try {
      return super.searchChange();
    } finally {
      _$_MapViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeClick(int index) {
    final _$actionInfo = _$_MapViewModelBaseActionController.startAction(
        name: '_MapViewModelBase.changeClick');
    try {
      return super.changeClick(index);
    } finally {
      _$_MapViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
restaurants: ${restaurants},
isLoading: ${isLoading},
isClickedList: ${isClickedList},
mapController: ${mapController},
myIcon: ${myIcon},
markerList: ${markerList},
searchController: ${searchController},
isSearch: ${isSearch},
isRestaurantInfoVisible: ${isRestaurantInfoVisible},
resName: ${resName},
urunFiyat: ${urunFiyat},
urunResim: ${urunResim},
panelController: ${panelController}
    ''';
  }
}
