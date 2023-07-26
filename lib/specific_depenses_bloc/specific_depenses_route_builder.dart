import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/specific_depenses_bloc/specific_depenses_bloc.dart';
import 'package:pfe_iheb/specific_depenses_bloc/specific_depenses_widget.dart';

class SpecificDepensesScreenRouteBuilder {
  final String gda;
  final int month;
  final int year;
  SpecificDepensesScreenRouteBuilder(this.gda, this.month, this.year);

  Widget call(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SpecificDepensesBloc()
            ..loadSpecificRecettesRealisees(gda, month, year),
        ),
      ],
      child: SpecificDepensesPage(gda: gda, month: month, year: year),
    );
  }
}
