import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/weather_bloc/weather_model.dart';
import 'package:http/http.dart' as http;

part 'weather_events.dart';
part 'weather_states.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(const InitialWeatherState._()) {
    on<LoadWeatherFuncEvent>(_load);
  }
  Future<void> _load(
    LoadWeatherFuncEvent event,
    Emitter<WeatherState> emitter,
  ) async {
    emitter(const LoadingWeatherState._());
    WeatherModel model;
    String url =
        'https://api.openweathermap.org/data/2.5/weather?q=${event.location}&appid=65a0a4c91ec65aa07f83a60edee8748d&units=metric';
    Map<String, String> headers = {"Content-type": "application/json"};
    http.Response response = await http.get(url, headers: headers);
    model = WeatherModel.fromJson(jsonDecode(response.body));
    emitter(LoadedWeatherState._(model));
  }

  void loadWeather(String location) {
    add(LoadWeatherFuncEvent._(location));
  }
}
