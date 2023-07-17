part of 'navigation.dart';

abstract class RoutesFactory {
  Route<dynamic> createSplashScreenPageRoute();
  Route<dynamic> createLoginScreenPageRoute();
  Route<dynamic> createModifyPasswordScreenPageRoute();
  Route<dynamic> createStatisticsScreenPageRoute();
  Route<dynamic> createIndicateursScreenPageRoute();
  Route<dynamic> createIndicateursSpecifiqueScreenPageRoute(
      int month, int year);
  Route<dynamic> createConsultationScreenPageRoute();
  Route<dynamic> createFicheGDAScreenPageRoute();
  Route<dynamic> createDetailsScreenPageRoute(FicheGDAModel modele);
  Route<dynamic> createDonneesTechniquesPageRoute();
  Route<dynamic> createRecettesRealiseesPageRoute();
  Route<dynamic> createDepensesRealiseesPageRoute();
  Route<dynamic> createWeatherPageRoute();
}
