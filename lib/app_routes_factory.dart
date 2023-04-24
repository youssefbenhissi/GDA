import 'package:flutter/material.dart';
import 'package:pfe_iheb/consultation_screen_bloc/consultation_screen_page_route_builder.dart';
import 'package:pfe_iheb/indicateur_bloc/indicateur_page_route_builder.dart';
import 'package:pfe_iheb/home_screen_bloc/home_screen_page_route_builder.dart';
import 'package:pfe_iheb/login_bloc/login_page_route_builder.dart';
import 'package:pfe_iheb/modify_password_bloc/modify_password_page_route_builder.dart';
import 'package:pfe_iheb/navigation/navigation.dart';
import 'package:pfe_iheb/splash_screen_bloc/splash_screen_page_route_builder.dart';
import 'package:pfe_iheb/statistics_bloc/statistics_page_route_builder.dart';

class AppRoutesFactory extends RoutesFactory {
  AppRoutesFactory();
  @override
  Route<dynamic> createSplashScreenPageRoute() {
    return MaterialPageRoute<String?>(
      builder: SplashScreenRouteBuilder(),
    );
  }

  @override
  Route<dynamic> createHomeScreenPageRoute() {
    return MaterialPageRoute<String?>(
      builder: HomeScreenRouteBuilder(),
    );
  }

  @override
  Route<dynamic> createLoginScreenPageRoute() {
    return MaterialPageRoute<String?>(
      builder: LoginScreenRouteBuilder(),
    );
  }

  @override
  Route<dynamic> createModifyPasswordScreenPageRoute() {
    return MaterialPageRoute<String?>(
      builder: ModifyPasswordScreenRouteBuilder(),
    );
  }

  @override
  Route<dynamic> createStatisticsScreenPageRoute() {
    return MaterialPageRoute<String?>(
      builder: StatisticsScreenRouteBuilder(),
    );
  }

  @override
  Route<dynamic> createIndicateursScreenPageRoute() {
    return MaterialPageRoute<String?>(
      builder: IndicateurScreenRouteBuilder(),
    );
  }

  @override
  Route<dynamic> createConsultationScreenPageRoute() {
    return MaterialPageRoute<String?>(
      builder: ConsultationScreenRouteBuilder(),
    );
  }
}
