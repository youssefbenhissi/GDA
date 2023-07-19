import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/specific_donnees_techniques/specific_donnes_techniques_widget.dart';
import 'package:pfe_iheb/specific_fiche_gda_bloc/specific_fiche_gda_model.dart';
import 'package:pfe_iheb/splash_screen_bloc/splash_screen_bloc.dart';

class SpecificDonneesTechniquesScreenRouteBuilder {
  final SpecificFicheGDAModel _modele;
  SpecificDonneesTechniquesScreenRouteBuilder(this._modele);

  Widget call(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SplashScreenBloc(),
        ),
      ],
      child: SpecificDonneesTechniquesPage(modele: _modele),
    );
  }
}
