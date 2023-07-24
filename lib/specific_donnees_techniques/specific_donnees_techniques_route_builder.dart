import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/specific_donnees_techniques/specific_donnees_techniques_bloc.dart';
import 'package:pfe_iheb/specific_donnees_techniques/specific_donnes_techniques_widget.dart';

class SpecificDonneesTechniquesScreenRouteBuilder {
  final String gda;
  final int month;
  final int year;
  SpecificDonneesTechniquesScreenRouteBuilder(this.gda, this.month, this.year);

  Widget call(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SpecificDonneesTechniquesBloc()
            ..loadSpecificDonneesTechniques(gda, month, year),
        ),
      ],
      child: SpecificDonneesTechniquesPage(
        gda: gda,
        month: month,
        year: year,
      ),
    );
  }
}
