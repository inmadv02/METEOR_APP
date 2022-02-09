import 'package:flutter/material.dart';
import 'package:meteor_app_proyecto/models/current_response.dart';
import 'package:meteor_app_proyecto/models/location_response.dart';
import 'package:meteor_app_proyecto/pages/intro_page.dart';
import 'package:meteor_app_proyecto/services/location_service.dart';
import 'package:meteor_app_proyecto/styles.dart';
import 'package:meteor_app_proyecto/utils/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  late LocationService locationService;
  late City city;
  late Future<Current> futureCiudad;

  @override
  void initState() {
    locationService = LocationService();
    /*city = locationService
        .getCityLocation(PreferenceUtils.getString("ciudad") ?? ' ');*/

    /*locationService
        .getCityByName2(PreferenceUtils.getString("ciudad")!)
        .then((value) => city = value);*/

    futureCiudad = locationService.getCityLocation(
        PreferenceUtils.getDouble("lat")!, PreferenceUtils.getDouble("lon")!);
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
          SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 60, 0, 8),
                      child: Text('Sevilla',
                          textAlign: TextAlign.center,
                          style: Styles.textNormalCustom(
                              35, Styles.blanco, FontWeight.w500))),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 8),
                      child: Text('7 de enero, 2022',
                          style: Styles.textNormalCustom(
                              16, Styles.blanco, FontWeight.w300))),
                  Image.asset('assets/icons/09n.png',
                      width: MediaQuery.of(context).size.width * 0.45),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                    FutureBuilder<Current>(
                        future: futureCiudad,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return _data(snapshot.data!);
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }
                          return const CircularProgressIndicator();
                        }),
                    Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/icons/temp-max.png',
                                  width: 20,
                                ),
                                Text(' 27ºC',
                                    style: Styles.textNormalCustom(
                                        13, Styles.blanco, FontWeight.w400))
                              ],
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/icons/temp-min.png',
                                      width: 20,
                                    ),
                                    Text(' 18ºC',
                                        style: Styles.textNormalCustom(
                                            13, Styles.blanco, FontWeight.w400))
                                  ],
                                ))
                          ],
                        )),
                  ]),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(5, 25, 5, 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Humedad',
                                    style: Styles.textNormalCustom(
                                        15, Styles.blanco, FontWeight.w300)),
                                Text('60%',
                                    style: Styles.textNormalCustom(
                                        17, Styles.blanco, FontWeight.w600))
                              ]),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Viento',
                                    style: Styles.textNormalCustom(
                                        15, Styles.blanco, FontWeight.w300)),
                                Text('3km/h',
                                    style: Styles.textNormalCustom(
                                        17, Styles.blanco, FontWeight.w600))
                              ]),
                        ],
                      )),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10, 5, 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Sens. térmica',
                                    style: Styles.textNormalCustom(
                                        15, Styles.blanco, FontWeight.w300)),
                                Text('23ºC',
                                    style: Styles.textNormalCustom(
                                        17, Styles.blanco, FontWeight.w600))
                              ]),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Presión',
                                    style: Styles.textNormalCustom(
                                        15, Styles.blanco, FontWeight.w300)),
                                Text('1028,28 hPa',
                                    style: Styles.textNormalCustom(
                                        17, Styles.blanco, FontWeight.w600))
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
              )),
        ])));
  }
}

Widget _data(Current currentWeather) {
  return Text(currentWeather.temp.toString());
}
