import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meteor_app_proyecto/styles.dart';
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
  static LatLng location = const LatLng(40.712784, -74.005941);

  CameraPosition _kGooglePlex = CameraPosition(
    target: location,
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bodyBackground,
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 1,
          child: Stack(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.16,
                  decoration: const BoxDecoration(color: Styles.azulMenu),
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(7, 60, 0, 0),
                      child: Row(children: [
                        Image.asset('assets/images/logo.png', width: 30),
                        Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text('Meteor'.toUpperCase(),
                                style: Styles.textLogoCustom(18)))
                      ]))),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 110, 8, 10),
                    child: Text('Cambia tu ubicación',
                        style: Styles.textTitleCustom(18)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 30),
                    child: Text(
                        'Marca la posición que quieras en el mapa para obtener los datos de otra localización',
                        textAlign: TextAlign.center,
                        style: Styles.textNormalCustom(
                            14, Styles.blanco, FontWeight.w500)),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.57,
                    child: GoogleMap(
                      initialCameraPosition: _kGooglePlex,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                      onTap: (LatLng posicion) {
                        setState(() {
                          location = posicion;

                          _kGooglePlex = CameraPosition(
                            target:
                                LatLng(posicion.latitude, posicion.longitude),
                            zoom: 14.4746,
                          );
                        });

                        PreferenceUtils.setDouble("lat", posicion.latitude);
                        PreferenceUtils.setDouble("lon", posicion.longitude);
                      },
                      markers: <Marker>{_createMarker()},
                      onLongPress: (LatLng posicion) {
                        setState(() {
                          location = posicion;
                          _kGooglePlex = CameraPosition(
                            target:
                                LatLng(posicion.latitude, posicion.longitude),
                            zoom: 14.4746,
                          );
                        });
                        PreferenceUtils.setDouble("lat", posicion.latitude);
                        PreferenceUtils.setDouble("lon", posicion.longitude);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Marker _createMarker() {
    return Marker(markerId: const MarkerId("marker"), position: location);
  }
}
