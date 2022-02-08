import 'package:flutter/material.dart';
import 'package:meteor_app_proyecto/pages/home_page.dart';
import 'package:meteor_app_proyecto/pages/intro_page.dart';
import 'package:meteor_app_proyecto/pages/location_page.dart';
import 'package:meteor_app_proyecto/pages/settings_page.dart';
import 'package:meteor_app_proyecto/styles.dart';
import 'package:meteor_app_proyecto/utils/preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  PreferenceUtils.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(backgroundColor: Styles.bodyBackground),
      initialRoute: '/',
      routes: {
        '/': (context) => const IntroPage(),
        '/location': (context) => const LocationPage(),
        '/home': (context) => const HomePage(),
        '/settings': (context) => const SettingsPage(),
      },
    );
  }
}
