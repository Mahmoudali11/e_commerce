

import 'package:flutter/material.dart';
class AppLang with ChangeNotifier {
  Locale n = Locale("en");
  void changlan() {
    if (n.languageCode == "en") {
      n = Locale("ar");
    } else {
      n = Locale("en");
    }
    notifyListeners();
  }}