import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/fiche_gda_bloc/fiche_gda_bloc.dart';
import 'package:pfe_iheb/fiche_gda_bloc/fiche_gda_widget.dart';

class FicheGDAScreenRouteBuilder {
  FicheGDAScreenRouteBuilder();

  Widget call(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => FicheGDABloc()..loadGDA("youssef"),
        ),
      ],
      child: const FicheGDAPage(),
    );
  }
}
