part of 'navigation.dart';

Route<dynamic>? Function(RouteSettings settings) onGenerateAppRoute(
  RoutesFactory routesFactory,
) {
  return (RouteSettings settings) {
    switch (settings.name) {
      case _splashScreenPageRouteName:
        return routesFactory.createSplashScreenPageRoute();
      case _homePageRouteName:
        return routesFactory.createHomeScreenPageRoute();
      case _loginPageRouteName:
        return routesFactory.createLoginScreenPageRoute();
      case _modifyPasswordRouteName:
        return routesFactory.createModifyPasswordScreenPageRoute();
      default:
        return routesFactory.createLoginScreenPageRoute();
    }
  };
}
