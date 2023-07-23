import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/app_page_injectable.dart';
import 'package:pfe_iheb/login_bloc/login_bloc.dart';
import 'package:pfe_iheb/statistics_bloc/statistics_bloc.dart';
import 'package:pfe_iheb/statistics_bloc/statistics_widget.dart';

class StatisticsScreenRouteBuilder {
  StatisticsScreenRouteBuilder();

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => StatisticsBloc()..loadStatistics("admin"),
        ),
      ],
      child: const StatisticsPage(),
    );
  }
}
