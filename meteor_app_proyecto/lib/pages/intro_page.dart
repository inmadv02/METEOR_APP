import 'package:flutter/material.dart';

import 'package:meteor_app_proyecto/styles.dart';
import 'package:meteor_app_proyecto/utils/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  String ciudadEjemplo = ' ';
  final _formKey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();

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
                child: Form(
                    key: _formKey,
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: TextFormField(
                          controller: textEditingController,
                          decoration: InputDecoration(
                              label: const Text("Search"),
                              filled: true,
                              fillColor: Colors.white,
                              labelStyle: Styles.textNormalCustom(
                                  14, Colors.black, FontWeight.w400),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                                borderSide:
                                    BorderSide(color: Styles.moradoCard),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                                borderSide: BorderSide(color: Colors.white),
                              )),
                          validator: (ciudadEjemplo) {
                            if (ciudadEjemplo == null ||
                                ciudadEjemplo.isEmpty) {
                              return 'Por favor, introduce una ciudad';
                            }
                          },
                        )))),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.height * 0.06,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Styles.blanco),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0))),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ciudadEjemplo = textEditingController.text;
                        PreferenceUtils.setString("ciudad", ciudadEjemplo);
                        Navigator.pushNamed(context, '/home',
                            arguments: ciudadEjemplo);
                      }
                    },
                    child: Text('Entrar'.toUpperCase(),
                        style: Styles.textNormalCustom(
                            14,
                            const Color.fromRGBO(16, 26, 57, 1),
                            FontWeight.w900))))
          ])),
    ]));
  }
}
