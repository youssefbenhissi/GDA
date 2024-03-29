part of 'navigation.dart';

class NavigationService {
  Future<void> openSplashScreen(BuildContext context) {
    return Navigator.of(context).pushNamed(_splashScreenPageRouteName);
  }

  Future<void> openLoginScreen(BuildContext context) {
    return Navigator.of(context).pushNamed(_loginPageRouteName);
  }

  Future<void> openModifyPasswordScreen(BuildContext context) {
    return Navigator.of(context).pushNamed(_modifyPasswordRouteName);
  }

  Future<void> openStatisticsScreen(BuildContext context) {
    return Navigator.of(context).pushNamed(_statisticsRouteName);
  }

  Future<void> openChartsScreen(BuildContext context) {
    return Navigator.of(context).pushNamed(_chartsRouteName);
  }

  Future<void> openIndicateursScreen(BuildContext context) {
    return Navigator.of(context).pushNamed(_indicateursRouteName);
  }

  Future<void> openIndicateursSpecifiqueScreen(
      BuildContext context, int month, int year) {
    return Navigator.of(context).pushNamed(_indicateursSpecifiqueRouteName,
        arguments: _SpecificIndicateurArguments(month, year));
  }

  Future<void> openSpecificFicheGDAScreen(
      BuildContext context, int month, int year, String gda) {
    return Navigator.of(context).pushNamed(_specificFicheGDARouteName,
        arguments: _SpecificFicheGDAArguments(month, year, gda));
  }

  Future<void> openConsultationScreen(BuildContext context) {
    return Navigator.of(context).pushNamed(_consultationRouteName);
  }

  Future<void> openFicheGDAScreen(BuildContext context) {
    return Navigator.of(context).pushNamed(_ficheGDARouteName);
  }

  Future<void> openDetailsScreen(BuildContext context, FicheGDAModel modele) {
    return Navigator.of(context).pushNamed(
      _detailsRouteName,
      arguments: _DetailsArguments(modele),
    );
  }

  Future<void> openSpecificDonneesTechniques(
      BuildContext context, String gda, int month, int year) {
    return Navigator.of(context).pushNamed(
      _specificDonneesTechniquesRouteName,
      arguments: _SpecificDonneesTechniquesArguments(gda, month, year),
    );
  }

  Future<void> openSpecificRecettesRealisees(
      BuildContext context, String gda, int month, int year) {
    return Navigator.of(context).pushNamed(
      _specificRecettesRealiseesRouteName,
      arguments: _SpecificRecettesRealiseesArguments(gda, month, year),
    );
  }

  Future<void> openSpecificDepenses(
      BuildContext context, String gda, int month, int year) {
    return Navigator.of(context).pushNamed(
      _specificDepensesRouteName,
      arguments: _SpecificDepensesArguments(gda, month, year),
    );
  }

  Future<void> openDonneesTechniquesScreen(BuildContext context) {
    return Navigator.of(context).pushNamed(_saisirDonneesTechniquesRouteName);
  }

  Future<void> openRecettesRealiseesScreen(
      BuildContext context, int month, int year) {
    return Navigator.of(context).pushNamed(_saisirRecettesRealiseesRouteName,
        arguments: _SpecificIndicateurArguments(month, year));
  }

  Future<void> openDepensesRealiseesScreen(
      BuildContext context, int month, int year) {
    return Navigator.of(context).pushNamed(_saisirDepensesRealiseesRouteName,
        arguments: _SpecificIndicateurArguments(month, year));
  }

  Future<void> openWeatherScreen(BuildContext context, String location) {
    return Navigator.of(context)
        .pushNamed(_weatherRouteName, arguments: _WeatherArguments(location));
  }
}
