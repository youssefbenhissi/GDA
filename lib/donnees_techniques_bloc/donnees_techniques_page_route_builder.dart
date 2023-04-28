import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/donnees_techniques_bloc/donnees_techniques_widget.dart';
import 'package:pfe_iheb/splash_screen_bloc/splash_screen_bloc.dart';

class SaisirDonneesTechniquesScreenRouteBuilder {
  SaisirDonneesTechniquesScreenRouteBuilder();

  Widget call(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SplashScreenBloc(),
        ),
      ],
      child: const SaisirDonneesTechniquesPage(),
    );
  }
}
