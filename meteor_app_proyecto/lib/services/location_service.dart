import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meteor_app_proyecto/models/adress_components_response.dart';
import 'package:meteor_app_proyecto/models/current_response.dart';
import 'package:meteor_app_proyecto/models/location_response.dart';
import 'package:meteor_app_proyecto/models/predictions_response.dart';

class LocationService {
  Future<Predictions> getCityByName2(String name) async {
    final result = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$name&key=AIzaSyC4GrRSpLl5avrtfOK9OSKrGHOiI1dXoms'));

    if (result.statusCode == 200) {
      return Predictions.fromJson(jsonDecode(result.body));
    } else {
      throw Exception('No se ha podido obtener la ciudad D:');
    }
  }

  Future<Result> getPlaceId(String name, String placeId) async {
    final result = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/details/json?input=$name&placeid=$placeId&key=AIzaSyC4GrRSpLl5avrtfOK9OSKrGHOiI1dXoms'));

    if (result.statusCode == 200) {
      return Result.fromJson(jsonDecode(result.body));
    } else {
      throw Exception('No se ha podido obtener la ciudad D`:');
    }
  }

  Future<City> getCityLocation(double lat, double lon) async {
    final result = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=00bfbfb7579241d929c5b460be1fc5b3&units=metric'));

    if (result.statusCode == 200) {
      return City.fromJson(jsonDecode(result.body));
    } else {
      throw Exception('No se ha podido obtener la ciudad D`:');
    }
  }

  Future<City> getCityByName(String name) async {
    final result = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?q=$name&appid=00bfbfb7579241d929c5b460be1fc5b3'));

    if (result.statusCode == 200) {
      return City.fromJson(jsonDecode(result.body));
    } else {
      throw Exception('No se ha podido obtener la ciudad D:');
    }
  }

  Future<WeatherResponse> getHourlyWeather(double lat, double lon) async {
    final result = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&appid=00bfbfb7579241d929c5b460be1fc5b3&units=metric'));

    if (result.statusCode == 200) {
      return WeatherResponse.fromJson(jsonDecode(result.body));
    } else {
      throw Exception('No se ha podido obtener la ciudad D:');
    }
  }
}
