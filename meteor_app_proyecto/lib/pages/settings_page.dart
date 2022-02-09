import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meteor_app_proyecto/utils/preferences.dart';

import 'page.dart';

CameraPosition _kInitialPosition =
    const CameraPosition(target: LatLng(37.3826, -6.0066), zoom: .0);

class SettingsPage extends GoogleMapExampleAppPage {
  const SettingsPage() : super(const Icon(Icons.mouse), 'Map click');

  @override
  Widget build(BuildContext context) {
    return const _SettingsPage();
  }
}

class _SettingsPage extends StatefulWidget {
  const _SettingsPage();

  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<_SettingsPage> {
  final Completer<GoogleMapController> _controller = Completer();
  LatLng location = const LatLng(40.712784, -74.005941);

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        onTap: (LatLng posicion) {
          setState(() {
            location = posicion;
          });

          PreferenceUtils.setDouble("lat", posicion.latitude);
          PreferenceUtils.setDouble("lon", posicion.longitude);
        },
        markers: <Marker>{_createMarker()},
        onLongPress: (LatLng posicion) {
          setState(() {
            location = posicion;
          });
          PreferenceUtils.setDouble("lat", posicion.latitude);
          PreferenceUtils.setDouble("lon", posicion.longitude);
        },
      ),
    );
  }

  Marker _createMarker() {
    return Marker(markerId: const MarkerId("marker"), position: location);
  }
}
