import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/recettes_realisees_screen/recettes_realisees_bloc.dart';
import 'package:pfe_iheb/recettes_realisees_screen/recettes_realisees_widget.dart';

class RecettesRealiseesScreenRouteBuilder {
  final int month;
  final int year;
  RecettesRealiseesScreenRouteBuilder(
      {required this.month, required this.year});

  Widget call(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => RecettesRealiseesBloc(),
        ),
      ],
      child: RecettesRealiseePage(month: month, year: year),
    );
  }
}
