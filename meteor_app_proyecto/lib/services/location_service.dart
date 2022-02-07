import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meteor_app_proyecto/models/location_response.dart';

class LocationService {
  Future<Location> getCity(String cityName) async {
    final result = await http.get(Uri.parse(
        'api.openweathermap.org/data/2.5/weather?q=$cityName&appid=00bfbfb7579241d929c5b460be1fc5b3'));

    if (result.statusCode == 200) {
      return Location.fromJson(jsonDecode(result.body));
    } else {
      throw Exception('No se ha podido obtener la ciudad D:');
    }
  }
}
