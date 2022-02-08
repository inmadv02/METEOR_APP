import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meteor_app_proyecto/models/current_response.dart';
import 'package:meteor_app_proyecto/models/location_response.dart';

class LocationService {
  /*Future<Location> getCity(String lat, String lon) async {
    final result = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/onecall?lat=37.4111818&lon=-5.9763749&appid=00bfbfb7579241d929c5b460be1fc5b3'));

    if (result.statusCode == 200) {
      return Location.fromJson(jsonDecode(result.body));
    } else {
      throw Exception('No se ha podido obtener la ciudad D`:');
    }
  }*/

  Future<Current> getCityByLocation() async {
    final result = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/onecall?lat=37.4111818&lon=-5.9763749&appid=00bfbfb7579241d929c5b460be1fc5b3'));

    if (result.statusCode == 200) {
      return Current.fromJson(jsonDecode(result.body));
    } else {
      throw Exception('No se ha podido obtener la ciudad D`:');
    }
  }

  Future<Location> getCityByName(String name) async {
    final result = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?q=$name&appid=00bfbfb7579241d929c5b460be1fc5b3'));

    if (result.statusCode == 200) {
      return Location.fromJson(jsonDecode(result.body));
    } else {
      throw Exception('No se ha podido obtener la ciudad D:');
    }
  }
}
