import 'package:flutter/material.dart';
import 'package:pfe_iheb/consultation_screen_bloc/consultation_screen_page_route_builder.dart';
import 'package:pfe_iheb/depenses_bloc/depenses_page_toute_builder.dart';
import 'package:pfe_iheb/details_bloc/details_page_route_builder.dart';
import 'package:pfe_iheb/donnees_techniques_bloc/donnees_techniques_page_route_builder.dart';
import 'package:pfe_iheb/fiche_gda_bloc/fiche_gda_model.dart';
import 'package:pfe_iheb/fiche_gda_bloc/fiche_gda_page_route_builder.dart';
import 'package:pfe_iheb/indicateur_bloc/indicateur_page_route_builder.dart';
import 'package:pfe_iheb/login_bloc/login_page_route_builder.dart';
import 'package:pfe_iheb/modify_password_bloc/modify_password_page_route_builder.dart';
import 'package:pfe_iheb/navigation/navigation.dart';
import 'package:pfe_iheb/recettes_realisees_screen/recettes_realisees_page_route_builder.dart';
import 'package:pfe_iheb/specific_depenses_bloc/specific_depenses_route_builder.dart';
import 'package:pfe_iheb/specific_donnees_techniques/specific_donnees_techniques_route_builder.dart';
import 'package:pfe_iheb/specific_fiche_gda_bloc/specific_fiche_gda_page_route_builder.dart';
import 'package:pfe_iheb/specific_indicateur_bloc/specific_indicateur_page_route_builder.dart';
import 'package:pfe_iheb/specific_recettes_realisees_bloc/specific_recettes_realisees_page_route_builder.dart';
import 'package:pfe_iheb/splash_screen_bloc/splash_screen_page_route_builder.dart';
import 'package:pfe_iheb/statistics_bloc/statistics_page_route_builder.dart';
import 'package:pfe_iheb/weather_bloc/weather_page_route_builder.dart';

class AppRoutesFactory extends RoutesFactory {
  AppRoutesFactory();
  @override
  Route<dynamic> createSplashScreenPageRoute() {
    return MaterialPageRoute<String?>(
      builder: SplashScreenRouteBuilder(),
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
  Route<dynamic> createIndicateursSpecifiqueScreenPageRoute(
      int month, int year) {
    return MaterialPageRoute<String?>(
      builder: IndicateurSpecifiqueScreenRouteBuilder(month, year),
    );
  }

  @override
  Route<dynamic> createSpecificFicheGDAScreenPageRoute(
      int month, int year, String gda) {
    return MaterialPageRoute<String?>(
      builder: SpecificFicheGdaScreenRouteBuilder(month, year, gda),
    );
  }

  @override
  Route<dynamic> createConsultationScreenPageRoute() {
    return MaterialPageRoute<String?>(
      builder: ConsultationScreenRouteBuilder(),
    );
  }

  @override
  Route<dynamic> createFicheGDAScreenPageRoute() {
    return MaterialPageRoute<String?>(
      builder: FicheGDAScreenRouteBuilder(),
    );
  }

  @override
  Route<dynamic> createDetailsScreenPageRoute(FicheGDAModel modele) {
    return MaterialPageRoute<String?>(
      builder: DetailsScreenRouteBuilder(modele),
    );
  }

  @override
  Route<dynamic> createDonneesTechniquesPageRoute() {
    return MaterialPageRoute<String?>(
      builder: SaisirDonneesTechniquesScreenRouteBuilder(),
    );
  }

  @override
  Route<dynamic> createRecettesRealiseesPageRoute(
    int month,
    int year,
  ) {
    return MaterialPageRoute<String?>(
      builder: RecettesRealiseesScreenRouteBuilder(month: month, year: year),
    );
  }

  @override
  Route<dynamic> createDepensesRealiseesPageRoute(
    int month,
    int year,
  ) {
    return MaterialPageRoute<String?>(
      builder: DepensesRealiseesScreenRouteBuilder(month: month, year: year),
    );
  }

  @override
  Route<dynamic> createWeatherPageRoute(String location) {
    return MaterialPageRoute<String?>(
      builder: WeatherScreenRouteBuilder(location: location),
    );
  }

  @override
  Route createSpecificDonneesTechniquesScreenPageRoute(
      String gda, int month, int year) {
    return MaterialPageRoute<String?>(
      builder: SpecificDonneesTechniquesScreenRouteBuilder(gda, month, year),
    );
  }

  @override
  Route createSpecificRecettesRealiseesScreenPageRoute(
      String gda, int month, int year) {
    return MaterialPageRoute<String?>(
      builder: SpecificRecettesRealiseesScreenRouteBuilder(
        gda: gda,
        month: month,
        year: year,
      ),
    );
  }

  @override
  Route createSpecificDepensesScreenPageRoute(String gda, int month, int year) {
    return MaterialPageRoute<String?>(
      builder: SpecificDepensesScreenRouteBuilder(
        gda,
        month,
        year,
      ),
    );
  }
}
