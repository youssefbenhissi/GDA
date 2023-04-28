part of 'navigation.dart';

abstract class RoutesFactory {
  Route<dynamic> createSplashScreenPageRoute();
  Route<dynamic> createLoginScreenPageRoute();
  Route<dynamic> createModifyPasswordScreenPageRoute();
  Route<dynamic> createStatisticsScreenPageRoute();
  Route<dynamic> createIndicateursScreenPageRoute();
  Route<dynamic> createIndicateursSpecifiqueScreenPageRoute();
  Route<dynamic> createConsultationScreenPageRoute();
  Route<dynamic> createFicheGDAScreenPageRoute();
  Route<dynamic> createDetailsScreenPageRoute();
  Route<dynamic> createDonneesTechniquesPageRoute();
}
