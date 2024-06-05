import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  String currentLanguage = 'en';

  changeLanguage(String newLanguage) {
    if (currentLanguage == newLanguage) return;
    currentLanguage = newLanguage;

    notifyListeners();
  }

}
