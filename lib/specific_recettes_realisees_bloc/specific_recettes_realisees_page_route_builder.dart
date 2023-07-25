import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/specific_fiche_gda_bloc/specific_fiche_gda_model.dart';
import 'package:pfe_iheb/specific_recettes_realisees_bloc/specific_recettes_realisees_bloc.dart';
import 'package:pfe_iheb/specific_recettes_realisees_bloc/specific_recettes_widget.dart';
import 'package:pfe_iheb/splash_screen_bloc/splash_screen_bloc.dart';

class SpecificRecettesRealiseesScreenRouteBuilder {
  final String gda;
  final int month;
  final int year;
  SpecificRecettesRealiseesScreenRouteBuilder(
      {required this.gda, required this.month, required this.year});

  Widget call(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SpecificRecettesRealiseesBloc()
            ..loadSpecificRecettesRealisees(gda, month, year),
        ),
      ],
      child: SpecificRecettesRealiseePage(
        gda: gda,
        month: month,
        year: year,
      ),
    );
  }
}
