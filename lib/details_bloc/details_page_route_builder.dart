import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/details_bloc/details_widget.dart';
import 'package:pfe_iheb/fiche_gda_bloc/fiche_gda_model.dart';
import 'package:pfe_iheb/splash_screen_bloc/splash_screen_bloc.dart';

class DetailsScreenRouteBuilder {
  final FicheGDAModel _modele;
  DetailsScreenRouteBuilder(this._modele);

  Widget call(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SplashScreenBloc(),
        ),
      ],
      child: DetailsPage(modele: _modele),
    );
  }
}
