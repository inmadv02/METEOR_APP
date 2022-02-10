import 'package:flutter/material.dart';
import 'package:meteor_app_proyecto/models/current_response.dart';
import 'package:meteor_app_proyecto/models/location_response.dart';
import 'package:meteor_app_proyecto/pages/intro_page.dart';
import 'package:meteor_app_proyecto/services/location_service.dart';
import 'package:meteor_app_proyecto/styles.dart';
import 'package:meteor_app_proyecto/utils/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  late LocationService locationService;
  late City city;
  late Future<City> futureCiudad;
  late double lat, lon;

  @override
  void initState() {
    locationService = LocationService();

    lat = PreferenceUtils.getDouble("lat") ?? 0;
    lon = PreferenceUtils.getDouble("lon") ?? 0;

    futureCiudad = locationService.getCityLocation(lat, lon);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.bodyBackground,
        body: SingleChildScrollView(
            child: Column(children: [
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
          FutureBuilder<City>(
              future: futureCiudad,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                      width: MediaQuery.of(context).size.width * 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                              padding: const EdgeInsets.fromLTRB(0, 60, 0, 8),
                              child: Text(snapshot.data!.name.toString(),
                                  textAlign: TextAlign.center,
                                  style: Styles.textNormalCustom(
                                      35, Styles.blanco, FontWeight.w500))),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(30, 0, 30, 8),
                              child: Text(_date(snapshot.data!.dt),
                                  style: Styles.textNormalCustom(
                                      16, Styles.blanco, FontWeight.w300))),
                          Image.asset('assets/icons/09n.png',
                              width: MediaQuery.of(context).size.width * 0.45),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Text(
                                        snapshot.data!.main!.temp
                                                .toStringAsFixed(0) +
                                            'ºC',
                                        textAlign: TextAlign.right,
                                        style: Styles.textTitleCustom(50))),
                                Padding(
                                    padding: const EdgeInsets.all(9.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 18),
                                                child: Image.asset(
                                                  'assets/icons/temp-max.png',
                                                  width: 20,
                                                )),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 6),
                                                child: Text(
                                                    snapshot.data!.main!.tempMax
                                                            .toStringAsFixed(
                                                                0) +
                                                        'ºC',
                                                    style:
                                                        Styles.textNormalCustom(
                                                            14,
                                                            Styles.blanco,
                                                            FontWeight.w400)))
                                          ],
                                        ),
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                9, 10, 0, 0),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  'assets/icons/temp-min.png',
                                                  width: 20,
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 5),
                                                    child: Text(
                                                        snapshot.data!.main!
                                                                .tempMin
                                                                .toStringAsFixed(
                                                                    0) +
                                                            'ºC',
                                                        style: Styles
                                                            .textNormalCustom(
                                                                14,
                                                                Styles.blanco,
                                                                FontWeight
                                                                    .w400)))
                                              ],
                                            ))
                                      ],
                                    )),
                              ]),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(5, 25, 5, 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Humedad',
                                            style: Styles.textNormalCustom(
                                                15,
                                                Styles.blanco,
                                                FontWeight.w300)),
                                        Text(
                                            snapshot.data!.main!.humidity
                                                    .toString() +
                                                '%',
                                            style: Styles.textNormalCustom(17,
                                                Styles.blanco, FontWeight.w600))
                                      ]),
                                  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Viento',
                                            style: Styles.textNormalCustom(
                                                15,
                                                Styles.blanco,
                                                FontWeight.w300)),
                                        Text('3km/h',
                                            style: Styles.textNormalCustom(17,
                                                Styles.blanco, FontWeight.w600))
                                      ]),
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(5, 10, 5, 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Sens. térmica',
                                            style: Styles.textNormalCustom(
                                                15,
                                                Styles.blanco,
                                                FontWeight.w300)),
                                        Text('23ºC',
                                            style: Styles.textNormalCustom(17,
                                                Styles.blanco, FontWeight.w600))
                                      ]),
                                  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Presión',
                                            style: Styles.textNormalCustom(
                                                15,
                                                Styles.blanco,
                                                FontWeight.w300)),
                                        Text('1028,28 hPa',
                                            style: Styles.textNormalCustom(17,
                                                Styles.blanco, FontWeight.w600))
                                      ]),
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(18, 20, 0, 0),
                              child: Row(children: [
                                Text('Hoy',
                                    style: Styles.textNormalCustom(
                                        20, Styles.blanco, FontWeight.w400))
                              ]))
                        ],
                      ));
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              })
        ])));
  }

  String _date(int dt) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(dt * 1000);

    String formattedDate = DateFormat('EEEE, d MMMM').format(dateTime);

    return formattedDate;
  }
}
