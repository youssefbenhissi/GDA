import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/specific_donnees_techniques/specific_donnees_techniques_bloc.dart';
import 'package:pfe_iheb/specific_donnees_techniques/specific_donnes_techniques_widget.dart';
import 'package:pfe_iheb/specific_fiche_gda_bloc/specific_fiche_gda_model.dart';

class SpecificDonneesTechniquesScreenRouteBuilder {
  final SpecificFicheGDAModel _modele;
  SpecificDonneesTechniquesScreenRouteBuilder(this._modele);

  Widget call(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SpecificDonneesTechniquesBloc()
            ..loadSpecificDonneesTechniques("4160130", 12, 2018),
        ),
      ],
      child: SpecificDonneesTechniquesPage(modele: _modele),
    );
  }
}
