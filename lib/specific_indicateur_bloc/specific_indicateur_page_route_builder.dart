import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/app_page_injectable.dart';
import 'package:pfe_iheb/login_bloc/login_bloc.dart';
import 'package:pfe_iheb/specific_indicateur_bloc/specific_indicateur_bloc.dart';
import 'package:pfe_iheb/specific_indicateur_bloc/specific_indicateur_widget.dart';
import 'package:provider/provider.dart';

class IndicateurSpecifiqueScreenRouteBuilder {
  final int month;
  final int year;
  IndicateurSpecifiqueScreenRouteBuilder(this.month, this.year);

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
          create: (_) => SpecificIndicateurBloc()
            ..loadSpecifiqueIndicateur("user", month, year),
        ),
      ],
      child: SpecificIndicateurPage(month: month, year: year),
    );
  }
}
