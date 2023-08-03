import 'package:get_it/get_it.dart';
import 'package:pfe_iheb/consultation_screen_bloc/consultation_screen_bloc.dart';
import 'package:pfe_iheb/donnees_techniques_bloc/donnees_techniques_bloc.dart';
import 'package:pfe_iheb/fiche_gda_bloc/fiche_gda_bloc.dart';
import 'package:pfe_iheb/indicateur_bloc/indicateur_bloc.dart';
import 'package:pfe_iheb/login_bloc/login_bloc.dart';
import 'package:pfe_iheb/modify_password_bloc/modify_password_bloc.dart';
import 'package:pfe_iheb/navigation/navigation.dart';
import 'package:pfe_iheb/recettes_realisees_screen/recettes_realisees_bloc.dart';
import 'package:pfe_iheb/specific_depenses_bloc/specific_depenses_bloc.dart';
import 'package:pfe_iheb/specific_donnees_techniques/specific_donnees_techniques_bloc.dart';
import 'package:pfe_iheb/specific_indicateur_bloc/specific_indicateur_bloc.dart';
import 'package:pfe_iheb/specific_recettes_realisees_bloc/specific_recettes_realisees_bloc.dart';
import 'package:pfe_iheb/statistics_bloc/statistics_bloc.dart';
import 'package:pfe_iheb/weather_bloc/weather_bloc.dart';

class ServiceLocator {
  final GetIt _registry;

  ServiceLocator() : _registry = GetIt.asNewInstance();
  WeatherBloc get weatherBloc => _registry.get<WeatherBloc>();
  RecettesRealiseesBloc get recettesRealiseesBloc =>
      _registry.get<RecettesRealiseesBloc>();
  LoginBloc get loginBloc => _registry.get<LoginBloc>();
  SpecificDepensesBloc get specificDepensesBloc =>
      _registry.get<SpecificDepensesBloc>();
  SpecificRecettesRealiseesBloc get specificRecettesRealiseesBloc =>
      _registry.get<SpecificRecettesRealiseesBloc>();
  SpecificDonneesTechniquesBloc get specificDonneesTechniquesBloc =>
      _registry.get<SpecificDonneesTechniquesBloc>();
  SpecificIndicateurBloc get specificIndicateurBloc =>
      _registry.get<SpecificIndicateurBloc>();
  DonneesTechniquesBloc get donneesTechniquesBloc =>
      _registry.get<DonneesTechniquesBloc>();
  ModifyPasswordBloc get modifyPasswordBloc =>
      _registry.get<ModifyPasswordBloc>();
  FicheGDABloc get ficheGDABloc => _registry.get<FicheGDABloc>();
  IndicateurBloc get indicateurBloc => _registry.get<IndicateurBloc>();
  StatisticsBloc get statisticsBloc => _registry.get<StatisticsBloc>();
  NavigationService get navigationService => _registry.get<NavigationService>();
  ConsultationScreenBloc get consultationScreenBloc =>
      _registry.get<ConsultationScreenBloc>();
  void config() {
    _registry.registerLazySingleton(
      () => NavigationService(),
    );
    _registry.registerLazySingleton(
      () => RecettesRealiseesBloc(),
    );
    _registry.registerLazySingleton(
      () => LoginBloc(),
    );
    _registry.registerLazySingleton(
      () => ConsultationScreenBloc(),
    );
    _registry.registerLazySingleton(
      () => WeatherBloc(),
    );
    _registry.registerLazySingleton(
      () => ModifyPasswordBloc(),
    );
    _registry.registerLazySingleton(
      () => FicheGDABloc(),
    );
    _registry.registerLazySingleton(
      () => IndicateurBloc(),
    );
    _registry.registerLazySingleton(
      () => DonneesTechniquesBloc(),
    );
    _registry.registerLazySingleton(
      () => StatisticsBloc(),
    );
    _registry.registerLazySingleton(
      () => SpecificIndicateurBloc(),
    );
    _registry.registerLazySingleton(
      () => SpecificDonneesTechniquesBloc(),
    );
    _registry.registerLazySingleton(
      () => SpecificRecettesRealiseesBloc(),
    );
    _registry.registerLazySingleton(
      () => SpecificDepensesBloc(),
    );
  }
}
