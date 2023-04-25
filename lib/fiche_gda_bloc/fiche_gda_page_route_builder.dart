import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/fiche_gda_bloc/fiche_gda_widget.dart';
import 'package:pfe_iheb/splash_screen_bloc/splash_screen_bloc.dart';

class FicheGDAScreenRouteBuilder {
  FicheGDAScreenRouteBuilder();

  Widget call(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SplashScreenBloc(),
        ),
      ],
      child: const FicheGDAPage(),
    );
  }
}
