import 'package:flutter/material.dart';
import 'package:mobileshop/l10n/all.dart';

class LocaleProvider with ChangeNotifier {
  Locale? _locale;
  Locale get locale => _locale!;
  void setLocale(Locale locale) {
    if (!AllLocales.all.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }
}
