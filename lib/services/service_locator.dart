import 'package:get_it/get_it.dart';
import 'package:pfe_iheb/login_bloc/login_bloc.dart';
import 'package:pfe_iheb/navigation/navigation.dart';

class ServiceLocator {
  final GetIt _registry;

  ServiceLocator() : _registry = GetIt.asNewInstance();
  LoginBloc get loginBloc => _registry.get<LoginBloc>();
  NavigationService get navigationService => _registry.get<NavigationService>();

  void config() {
    _registry.registerLazySingleton(
      () => NavigationService(),
    );
    _registry.registerLazySingleton(
      () => LoginBloc(),
    );
  }
}
