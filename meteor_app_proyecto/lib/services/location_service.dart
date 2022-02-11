import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:meteor_app_proyecto/models/current_response.dart';
import 'package:meteor_app_proyecto/models/location_response.dart';

class LocationService {
  Future<City> getCityLocation(double lat, double lon) async {
    final result = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=00bfbfb7579241d929c5b460be1fc5b3&units=metric'));

    if (result.statusCode == 200) {
      return City.fromJson(jsonDecode(result.body));
    } else {
      throw Exception('No se ha podido obtener la ciudad D`:');
    }
  }

  Future<WeatherResponse> getWeather(double lat, double lon) async {
    final result = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&appid=00bfbfb7579241d929c5b460be1fc5b3&units=metric'));

    if (result.statusCode == 200) {
      return WeatherResponse.fromJson(jsonDecode(result.body));
    } else {
      throw Exception('No se ha podido obtener la ciudad D:');
    }
  }
}
