import 'package:flutter/material.dart';
import 'package:pfe_iheb/home_screen_bloc/home_screen_page_route_builder.dart';
import 'package:pfe_iheb/login_bloc/login_page_route_builder.dart';
import 'package:pfe_iheb/modify_password_bloc/modify_password_page_route_builder.dart';
import 'package:pfe_iheb/navigation/navigation.dart';
import 'package:pfe_iheb/services/service_locator.dart';
import 'package:pfe_iheb/splash_screen_bloc/splash_screen_page_route_builder.dart';

class AppRoutesFactory extends RoutesFactory {
  final ServiceLocator _serviceLocator;

  AppRoutesFactory(this._serviceLocator);
  Route<dynamic> createSplashScreenPageRoute() {
    return MaterialPageRoute<String?>(
      builder: SplashScreenRouteBuilder(),
    );
  }

  Route<dynamic> createHomeScreenPageRoute() {
    return MaterialPageRoute<String?>(
      builder: HomeScreenRouteBuilder(),
    );
  }

  Route<dynamic> createLoginScreenPageRoute() {
    return MaterialPageRoute<String?>(
      builder: LoginScreenRouteBuilder(),
    );
  }
   Route<dynamic> createModifyPasswordScreenPageRoute() {
    return MaterialPageRoute<String?>(
      builder: ModifyPasswordScreenRouteBuilder(),
    );
  }
}
