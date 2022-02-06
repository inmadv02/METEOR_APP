import 'package:flutter/material.dart';
import 'package:meteor_app_proyecto/models/location_response.dart';
import 'package:meteor_app_proyecto/styles.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  List<String> listaCiudades = ["Sevilla", "Londres", "Madrid", "Barcelona"];
  late Location ciudadEjemplo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
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
                    child: Image.asset('assets/images/logo.png',
                        width: MediaQuery.of(context).size.width * 0.11))),
            Padding(
                padding: const EdgeInsets.fromLTRB(3, 3, 3, 50),
                child: Text('Meteor'.toUpperCase(), style: Styles.textLogo)),
            Padding(
                padding: const EdgeInsets.fromLTRB(3, 3, 3, 20),
                child:
                    Text('Elige tu ciudad', style: Styles.textTitleCustom(23))),
            Padding(
                padding: const EdgeInsets.fromLTRB(3, 20, 3, 50),
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                        color: Styles.moradoCard,
                        borderRadius: BorderRadius.circular(18.0)),
                    child: DropdownButton(
                      icon: const Icon(Icons.search,
                          color: Colors.black, size: 25),
                      isExpanded: true,
                      dropdownColor: Styles.moradoCard,
                      value: ciudadEjemplo.name,
                      onChanged: (String? newValue) {
                        setState(() {
                          ciudadEjemplo.name = newValue!;
                        });
                      },
                      items: listaCiudades
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      style: Styles.textNormalCustom(
                          16, Styles.bodyBackground, FontWeight.normal),
                    ))),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.height * 0.06,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Styles.blanco),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0))),
                    ),
                    onPressed: () => Navigator.pushNamed(context, '/location',
                        arguments: ciudadEjemplo),
                    child: Text('Entrar'.toUpperCase(),
                        style: Styles.textNormalCustom(
                            14,
                            const Color.fromRGBO(16, 26, 57, 1),
                            FontWeight.w900))))
          ])),
    ]));
  }
}
