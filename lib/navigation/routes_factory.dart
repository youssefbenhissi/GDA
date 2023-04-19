part of 'navigation.dart';

abstract class RoutesFactory {
  Route<dynamic> createSplashScreenPageRoute();
  Route<dynamic> createHomeScreenPageRoute();
  Route<dynamic> createLoginScreenPageRoute();
  Route<dynamic> createModifyPasswordScreenPageRoute();
  Route<dynamic> createStatisticsScreenPageRoute();
}
