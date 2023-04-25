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
        return routesFactory.createIndicateursSpecifiqueScreenPageRoute();
      case _consultationRouteName:
        return routesFactory.createConsultationScreenPageRoute();
      case _ficheGDARouteName:
        return routesFactory.createFicheGDAScreenPageRoute();
      default:
        return routesFactory.createLoginScreenPageRoute();
    }
  };
}
