// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MapViewModel on _MapViewModelBase, Store {
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
  String toString() {
    return '''
mapController: ${mapController},
myIcon: ${myIcon},
markerList: ${markerList},
searchController: ${searchController},
isSearch: ${isSearch}
    ''';
  }
}
