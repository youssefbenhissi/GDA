import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/app_page_injectable.dart';
import 'package:pfe_iheb/indicateur_bloc/indicateur_bloc.dart';
import 'package:pfe_iheb/indicateur_bloc/indicateur_widget.dart';
import 'package:pfe_iheb/login_bloc/login_bloc.dart';
import 'package:provider/provider.dart';

class IndicateurScreenRouteBuilder {
  IndicateurScreenRouteBuilder();

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
          create: (_) => IndicateurBloc()..loadIndicateur("admin"),
        ),
      ],
      child: const IndicateurPage(),
    );
  }
}
