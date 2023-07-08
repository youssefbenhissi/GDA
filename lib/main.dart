import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pfe_iheb/app_routes_factory.dart';
import 'package:pfe_iheb/login_bloc/login_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pfe_iheb/navigation/navigation.dart';
import 'package:pfe_iheb/provider/locale_provider.dart';
import 'package:pfe_iheb/services/service_locator.dart';
import 'package:pfe_iheb/splash_screen_bloc/splash_screen_bloc.dart';
import 'package:pfe_iheb/splash_screen_bloc/splash_screen_widget.dart';
import 'package:provider/provider.dart';
import 'l10n/l10n.dart';

void main() {
  final locator = ServiceLocator()..config();
  runApp(
    BlocProvider(
      create: (context) => SplashScreenBloc(),
      child: MyApp(serviceLocator: locator),
    ),
  );
}

class MyApp extends StatefulWidget {
  final ServiceLocator serviceLocator;
  const MyApp({
    super.key,
    required this.serviceLocator,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      builder: (context, child) {
        final provider = Provider.of<LocaleProvider>(context);
        return MultiRepositoryProvider(
          providers: [
            RepositoryProvider.value(value: widget.serviceLocator),
          ],
          child: MaterialApp(
            supportedLocales: L10n.all,
            onGenerateRoute: onGenerateAppRoute(
              AppRoutesFactory(),
            ),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            locale: provider.locale,
            home: BlocBuilder<SplashScreenBloc, SplashScreenState>(
              builder: (context, state) {
                context.read<SplashScreenBloc>().showSplashScreen();
                if (state is InitialSplashScreenState) {
                  return const SplashScreen();
                } else {
                  return LoginScreen();
                }
              },
            ),
          ),
        );
      });
}
