import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/consultation_screen_bloc/consultation_screen_bloc.dart';
import 'package:pfe_iheb/login_bloc/login_bloc.dart';
import 'package:pfe_iheb/modify_password_bloc/modify_password_bloc.dart';
import 'package:pfe_iheb/navigation/navigation.dart';
import 'package:pfe_iheb/services/service_locator.dart';

extension AppPageInjectable on BuildContext {
  NavigationService get gNavigationService =>
      read<ServiceLocator>().navigationService;
  LoginBloc get currentLoginBloc => read<ServiceLocator>().loginBloc;
  ConsultationScreenBloc get currentConsultationBloc =>
      read<ServiceLocator>().consultationScreenBloc;
  ModifyPasswordBloc get currentModifyPasswordBloc =>
      read<ServiceLocator>().modifyPasswordBloc;
}
