import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(children: [
      SizedBox(
          child: Padding(
              padding: EdgeInsets.all(6.0),
              child: Image.asset('assets/images/logo.png')))
    ]));
  }
}
