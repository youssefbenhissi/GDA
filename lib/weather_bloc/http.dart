import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pfe_iheb/weather_bloc/weather_model.dart';

class Weather {
  Future<WeatherModel>? getWeather(String? location) async {
    var endpoint = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=65a0a4c91ec65aa07f83a60edee8748d&units=metric');
    var respone = await http.get(endpoint);
    var body = jsonDecode(respone.body);
    return WeatherModel.fromjson(body);
  }
}
