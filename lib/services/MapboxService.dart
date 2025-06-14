
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:flutter/material.dart';

class MapboxService {
  static const String MAPBOX_ACCESS_TOKEN = "YOUR_MAPBOX_ACCESS_TOKEN";

  MapboxMapController? controller;

  void initController(MapboxMapController ctrl) {
    controller = ctrl;
  }

  void addBallMarker(double lat, double lng) {
    controller?.addSymbol(SymbolOptions(
      geometry: LatLng(lat, lng),
      iconImage: "golf-ball",
      iconSize: 1.5,
    ));
  }
}
