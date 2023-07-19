import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/specific_fiche_gda_bloc/specific_fiche_gda_model.dart';
import 'package:pfe_iheb/specific_recettes_realisees_bloc/specific_recettes_widget.dart';
import 'package:pfe_iheb/splash_screen_bloc/splash_screen_bloc.dart';

class SpecificRecettesRealiseesScreenRouteBuilder {
  final SpecificFicheGDAModel _modele;
  SpecificRecettesRealiseesScreenRouteBuilder(this._modele);

  Widget call(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SplashScreenBloc(),
        ),
      ],
      child: SpecificRecettesRealiseePage(modele: _modele),
    );
  }
}
