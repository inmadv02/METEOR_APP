import 'package:flutter/material.dart';
import 'package:meteor_app_proyecto/styles.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  List<String> listaCiudades = ["Sevilla", "Londres", "Madrid", "Barcelona"];

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
          decoration: const BoxDecoration(color: Styles.bodyBackground)),
      SizedBox(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
                child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Image.asset('assets/images/logo.png'))),
            Padding(
                padding: const EdgeInsets.fromLTRB(3, 3, 3, 20),
                child: Text('Meteor', style: Styles.textLogo)),
            Padding(
                padding: const EdgeInsets.fromLTRB(3, 3, 3, 20),
                child: Text('Elige tu ciudad', style: Styles.textTitle)),
            Padding(
                padding: const EdgeInsets.fromLTRB(3, 20, 3, 3),
                child: DropdownButton<String>(
                  items: listaCiudades.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {},
                  style: const TextStyle(backgroundColor: Styles.moradoCard),
                ))
          ])),
          ElevatedButton(onPressed: , child:)
    ]);
  }
}
