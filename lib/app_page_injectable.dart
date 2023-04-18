import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/navigation/navigation.dart';
import 'package:pfe_iheb/services/service_locator.dart';

extension AppPageInjectable on BuildContext {
  NavigationService get gNavigationService =>
      read<ServiceLocator>().navigationService;
}
