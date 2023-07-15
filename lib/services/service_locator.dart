import 'package:get_it/get_it.dart';
import 'package:pfe_iheb/consultation_screen_bloc/consultation_screen_bloc.dart';
import 'package:pfe_iheb/donnees_techniques_bloc/donnees_techniques_bloc.dart';
import 'package:pfe_iheb/fiche_gda_bloc/fiche_gda_bloc.dart';
import 'package:pfe_iheb/login_bloc/login_bloc.dart';
import 'package:pfe_iheb/modify_password_bloc/modify_password_bloc.dart';
import 'package:pfe_iheb/navigation/navigation.dart';

class ServiceLocator {
  final GetIt _registry;

  ServiceLocator() : _registry = GetIt.asNewInstance();
  LoginBloc get loginBloc => _registry.get<LoginBloc>();
  DonneesTechniquesBloc get donneesTechniquesBloc =>
      _registry.get<DonneesTechniquesBloc>();
  ModifyPasswordBloc get modifyPasswordBloc =>
      _registry.get<ModifyPasswordBloc>();
  FicheGDABloc get ficheGDABloc => _registry.get<FicheGDABloc>();
  NavigationService get navigationService => _registry.get<NavigationService>();
  ConsultationScreenBloc get consultationScreenBloc =>
      _registry.get<ConsultationScreenBloc>();
  void config() {
    _registry.registerLazySingleton(
      () => NavigationService(),
    );
    _registry.registerLazySingleton(
      () => LoginBloc(),
    );
    _registry.registerLazySingleton(
      () => ConsultationScreenBloc(),
    );
    _registry.registerLazySingleton(
      () => ModifyPasswordBloc(),
    );
    _registry.registerLazySingleton(
      () => FicheGDABloc(),
    );
    _registry.registerLazySingleton(
      () => DonneesTechniquesBloc(),
    );
  }
}
