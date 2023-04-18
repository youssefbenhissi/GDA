import 'package:flutter/material.dart';
import 'package:pfe_iheb/l10n/l10n.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale("fr");

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;

    _locale = locale;
    notifyListeners();
  }
}
