part of 'navigation.dart';

Route<dynamic>? Function(RouteSettings settings) onGenerateAppRoute(
  RoutesFactory routesFactory,
) {
  return (RouteSettings settings) {
    switch (settings.name) {
      case _splashScreenPageRouteName:
        return routesFactory.createSplashScreenPageRoute();

      case _loginPageRouteName:
        return routesFactory.createLoginScreenPageRoute();
      case _modifyPasswordRouteName:
        return routesFactory.createModifyPasswordScreenPageRoute();
      case _statisticsRouteName:
        return routesFactory.createStatisticsScreenPageRoute();
      case _indicateursRouteName:
        return routesFactory.createIndicateursScreenPageRoute();
      case _indicateursSpecifiqueRouteName:
        final args = settings.arguments as _SpecificIndicateurArguments;
        return routesFactory.createIndicateursSpecifiqueScreenPageRoute(
            args.month, args.year);
      case _consultationRouteName:
        return routesFactory.createConsultationScreenPageRoute();
      case _ficheGDARouteName:
        return routesFactory.createFicheGDAScreenPageRoute();
      case _detailsRouteName:
        final args = settings.arguments as _DetailsArguments;
        return routesFactory.createDetailsScreenPageRoute(args.modele);
      case _specificFicheGDARouteName:
        final args = settings.arguments as _SpecificFicheGDAArguments;
        return routesFactory.createSpecificFicheGDAScreenPageRoute(
            args.month, args.year, args.gda);
      case _saisirDonneesTechniquesRouteName:
        return routesFactory.createDonneesTechniquesPageRoute();
      case _saisirRecettesRealiseesRouteName:
        return routesFactory.createRecettesRealiseesPageRoute();
      case _saisirDepensesRealiseesRouteName:
        return routesFactory.createDepensesRealiseesPageRoute();
      case _specificDonneesTechniquesRouteName:
        final args = settings.arguments as _SpecificDonneesTechniquesArguments;
        return routesFactory.createSpecificDonneesTechniquesScreenPageRoute(
            args.specificFicheGDAModel);
      case _specificRecettesRealiseesRouteName:
        final args = settings.arguments as _SpecificRecettesRealiseesArguments;
        return routesFactory.createSpecificRecettesRealiseesScreenPageRoute(
            args.specificFicheGDAModel);
      case _weatherRouteName:
        return routesFactory.createWeatherPageRoute();
      default:
        return routesFactory.createLoginScreenPageRoute();
    }
  };
}
