import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meteor_app_proyecto/services/location_service.dart';
import 'package:meteor_app_proyecto/utils/preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final Completer<GoogleMapController> _controller = Completer();
  late LocationService locationService;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  void initState() {
    locationService = LocationService();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        onTap: (LatLng posicion) async {
          setState(() {
            locationService.getCityLocation(
                posicion.latitude, posicion.longitude);

            PreferenceUtils.setDouble("lat", posicion.latitude);
            PreferenceUtils.setDouble("lng", posicion.longitude);
          });
        },
      ),
    );
  }
}
