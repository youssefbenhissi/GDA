import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/splash_screen_bloc/splash_screen_bloc.dart';
import 'package:pfe_iheb/weather_bloc/weather_bloc.dart';
import 'package:pfe_iheb/weather_bloc/weather_widget.dart';

class WeatherScreenRouteBuilder {
  String location;
  WeatherScreenRouteBuilder({required this.location});

  Widget call(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => WeatherBloc()..loadWeather(location),
        ),
      ],
      child: WeatherPage(location: location),
    );
  }
}
