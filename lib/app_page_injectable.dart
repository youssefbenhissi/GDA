import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/consultation_screen_bloc/consultation_screen_bloc.dart';
import 'package:pfe_iheb/fiche_gda_bloc/fiche_gda_bloc.dart';
import 'package:pfe_iheb/login_bloc/login_bloc.dart';
import 'package:pfe_iheb/modify_password_bloc/modify_password_bloc.dart';
import 'package:pfe_iheb/navigation/navigation.dart';
import 'package:pfe_iheb/services/service_locator.dart';
import 'package:pfe_iheb/specific_depenses_bloc/specific_depenses_bloc.dart';
import 'package:pfe_iheb/specific_donnees_techniques/specific_donnees_techniques_bloc.dart';
import 'package:pfe_iheb/specific_indicateur_bloc/specific_indicateur_bloc.dart';
import 'package:pfe_iheb/specific_recettes_realisees_bloc/specific_recettes_realisees_bloc.dart';
import 'package:pfe_iheb/statistics_bloc/statistics_bloc.dart';
import 'package:pfe_iheb/weather_bloc/weather_bloc.dart';

import 'depenses_bloc/depenses_bloc.dart';
import 'donnees_techniques_bloc/donnees_techniques_bloc.dart';
import 'indicateur_bloc/indicateur_bloc.dart';
import 'recettes_realisees_screen/recettes_realisees_bloc.dart';

extension AppPageInjectable on BuildContext {
  NavigationService get gNavigationService =>
      read<ServiceLocator>().navigationService;
  LoginBloc get currentLoginBloc => read<ServiceLocator>().loginBloc;
  DepensesBloc get currentDepensesBloc => read<ServiceLocator>().depensesBloc;
  RecettesRealiseesBloc get currentRecettesRealiseesBloc =>
      read<ServiceLocator>().recettesRealiseesBloc;
  SpecificDepensesBloc get currentSpecificDepensesBloc =>
      read<ServiceLocator>().specificDepensesBloc;
  SpecificRecettesRealiseesBloc get currentSpecificRecettesRealiseesBloc =>
      read<ServiceLocator>().specificRecettesRealiseesBloc;
  SpecificDonneesTechniquesBloc get currentSpecificDonneesTechniquesBloc =>
      read<ServiceLocator>().specificDonneesTechniquesBloc;
  WeatherBloc get currentWeatherBloc => read<ServiceLocator>().weatherBloc;
  SpecificIndicateurBloc get currentSpecificIndicateurBloc =>
      read<ServiceLocator>().specificIndicateurBloc;
  DonneesTechniquesBloc get currentDonneesTechniquesBloc =>
      read<ServiceLocator>().donneesTechniquesBloc;
  ConsultationScreenBloc get currentConsultationBloc =>
      read<ServiceLocator>().consultationScreenBloc;
  ModifyPasswordBloc get currentModifyPasswordBloc =>
      read<ServiceLocator>().modifyPasswordBloc;
  FicheGDABloc get currentFicheGDABloc => read<ServiceLocator>().ficheGDABloc;
  IndicateurBloc get currentIndicateurABloc =>
      read<ServiceLocator>().indicateurBloc;
  StatisticsBloc get currentStatisticsBloc =>
      read<ServiceLocator>().statisticsBloc;
}
