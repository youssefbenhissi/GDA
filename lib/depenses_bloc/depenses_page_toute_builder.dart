import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/depenses_bloc/depenses_bloc.dart';
import 'package:pfe_iheb/depenses_bloc/depenses_widget.dart';
import 'package:pfe_iheb/splash_screen_bloc/splash_screen_bloc.dart';

class DepensesRealiseesScreenRouteBuilder {
  final int month;
  final int year;
  DepensesRealiseesScreenRouteBuilder(
      {required this.month, required this.year});

  Widget call(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => DepensesBloc(),
        ),
      ],
      child: DepensesPage(month: month, year: year),
    );
  }
}
