import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/app_page_injectable.dart';
import 'package:pfe_iheb/login_bloc/login_bloc.dart';
import 'package:pfe_iheb/specific_fiche_gda_bloc/specific_fiche_gda_bloc.dart';
import 'package:pfe_iheb/specific_fiche_gda_bloc/specific_gda_widget.dart';
import 'package:provider/provider.dart';

class SpecificFicheGdaScreenRouteBuilder {
  final int month;
  final int year;
  final int gda;
  SpecificFicheGdaScreenRouteBuilder(this.month, this.year, this.gda);

  Widget call(BuildContext context) {
    String login = "";
    var state = context.currentLoginBloc.state;
    if (state is GDALoginState) {
      login = state.model.login;
    } else if (state is DecideurGouvernoratLoginState) {
      login = state.model.login;
    }
    if (state is DecideurCentralLoginState) {
      login = state.model.login;
    }
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              SpecificFicheGDABloc()..loadSpecificGDA("userg", month, year, gda),
        ),
      ],
      child: const SpecificFicheGDAPage(),
    );
  }
}
