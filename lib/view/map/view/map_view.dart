import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oua/core/base/view/base_view.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
            appBar: AppBar(),
            body: Observer(
              builder: (_) {
                return GoogleMap(
                  onMapCreated: vm.onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: vm.center,
                    zoom: 13.0,
                  ),
                  markers: {vm.marker},
                );
              },
            )));
  }
}
