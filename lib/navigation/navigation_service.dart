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

  Future<void> openIndicateursScreen(BuildContext context) {
    return Navigator.of(context).pushNamed(_indicateursRouteName);
  }

  Future<void> openIndicateursSpecifiqueScreen(
      BuildContext context, int month, int year) {
    return Navigator.of(context).pushNamed(_indicateursSpecifiqueRouteName,
        arguments: _SpecificIndicateurArguments(month, year));
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

  Future<void> openDonneesTechniquesScreen(BuildContext context) {
    return Navigator.of(context).pushNamed(_saisirDonneesTechniquesRouteName);
  }

  Future<void> openRecettesRealiseesScreen(BuildContext context) {
    return Navigator.of(context).pushNamed(_saisirRecettesRealiseesRouteName);
  }

  Future<void> openDepensesRealiseesScreen(BuildContext context) {
    return Navigator.of(context).pushNamed(_saisirDepensesRealiseesRouteName);
  }

  Future<void> openWeatherScreen(BuildContext context) {
    return Navigator.of(context).pushNamed(_weatherRouteName);
  }
}
