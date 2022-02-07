import 'package:flutter/material.dart';
import 'package:meteor_app_proyecto/models/location_response.dart';
import 'package:meteor_app_proyecto/styles.dart';

/*class LocationWeather {
  final String ciudad;
  LocationWeather(this.ciudad);
}*/

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    //final args = ModalRoute.of(context)!.settings.arguments as LocationWeather;

    return Scaffold(
        body: Stack(children: [
      Container(color: Styles.bodyBackground),
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
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 8),
                  child: Text('Lagos Nigeria',
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
                Text('26ºC',
                    style: Styles.textNormalCustom(
                        60, Styles.blanco, FontWeight.w600)),
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
              ])
            ],
          ))
    ]));
  }
}
