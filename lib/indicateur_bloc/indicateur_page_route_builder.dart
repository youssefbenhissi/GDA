import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/indicateur_bloc/indicateur_bloc.dart';
import 'package:pfe_iheb/indicateur_bloc/indicateur_widget.dart';
import 'package:provider/provider.dart';

class IndicateurScreenRouteBuilder {
  IndicateurScreenRouteBuilder();

  Widget call(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => IndicateurBloc(),
        ),
      ],
      child: const IndicateurPage(),
    );
  }
}
