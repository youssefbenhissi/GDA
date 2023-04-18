import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/home_screen_bloc/home_screen_widget.dart';
import 'package:pfe_iheb/splash_screen_bloc/splash_screen_bloc.dart';
import 'package:pfe_iheb/splash_screen_bloc/splash_screen_widget.dart';

class HomeScreenRouteBuilder {
  HomeScreenRouteBuilder();

  Widget call(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SplashScreenBloc(),
        ),
      ],
      child: const HomePage(),
    );
  }
}
