
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import '../services/LocationService.dart';
import '../services/MapboxService.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapboxService _mapboxService = MapboxService();
  final LocationService _locationService = LocationService();

  static const String MAPBOX_TOKEN = MapboxService.MAPBOX_ACCESS_TOKEN;
  LatLng? _userLocation;

  @override
  void initState() {
    super.initState();
    _loadLocation();
  }

  void _loadLocation() async {
    final pos = await _locationService.getCurrentLocation();
    setState(() {
      _userLocation = LatLng(pos.latitude, pos.longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("JackTrack Map")),
      body: _userLocation == null
          ? const Center(child: CircularProgressIndicator())
          : MapboxMap(
              accessToken: MAPBOX_TOKEN,
              initialCameraPosition: CameraPosition(
                target: _userLocation!,
                zoom: 15,
              ),
              onMapCreated: _mapboxService.initController,
            ),
    );
  }
}
