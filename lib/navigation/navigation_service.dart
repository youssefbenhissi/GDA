part of 'navigation.dart';

class NavigationService {
  Future<void> openSplashScreen(BuildContext context) {
    return Navigator.of(context).pushNamed(_splashScreenPageRouteName);
  }

  Future<void> openHomeScreen(BuildContext context) {
    return Navigator.of(context).pushNamed(_homePageRouteName);
  }

  Future<void> openLoginScreen(BuildContext context) {
    return Navigator.of(context).pushNamed(_loginPageRouteName);
  }
}
