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
  Route<dynamic> createSpecificDonneesTechniquesScreenPageRoute(
      String gda, int month, int year);
  Route<dynamic> createSpecificRecettesRealiseesScreenPageRoute(
      String gda, int month, int year);
  Route<dynamic> createSpecificDepensesScreenPageRoute(
      String gda, int month, int year);
  Route<dynamic> createDonneesTechniquesPageRoute();
  Route<dynamic> createRecettesRealiseesPageRoute(int month, int year);
  Route<dynamic> createDepensesRealiseesPageRoute(int month, int year);
  Route<dynamic> createWeatherPageRoute(String location);
  Route<dynamic> createSpecificFicheGDAScreenPageRoute(
      int month, int year, String gda);
}
