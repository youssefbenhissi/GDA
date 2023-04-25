import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/specific_indicateur_bloc/specific_indicateur_bloc.dart';
import 'package:pfe_iheb/specific_indicateur_bloc/specific_indicateur_widget.dart';
import 'package:provider/provider.dart';

class IndicateurSpecifiqueScreenRouteBuilder {
  IndicateurSpecifiqueScreenRouteBuilder();

  Widget call(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => SpecificIndicateurBloc(),
        ),
      ],
      child: const SpecificIndicateurPage(),
    );
  }
}
