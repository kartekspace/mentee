

import 'package:tek_capsule/core/locale/languages/english.dart';
import 'package:tek_capsule/core/locale/languages/french.dart';
import 'package:tek_capsule/core/locale/languages/italian.dart';
import 'package:tek_capsule/core/locale/languages/portuguese.dart';
import 'package:tek_capsule/core/locale/languages/spanish.dart';

class AppConfig {
  static final String appName = 'Qu News';
  static final String packageName = 'com.flutter.qunews';
  static final String languageDefault = "en";
  static final Map<String, AppLanguage> languagesSupported = {
    'en': AppLanguage("English", english()),
    'pt': AppLanguage("Portugal", portuguese()),
    'fr': AppLanguage("Français", french()),
    'es': AppLanguage("Español", spanish()),
    'it': AppLanguage("italiano", italian())
  };
  static final bool isDemoMode = true;
}

class AppLanguage {
  final String name;
  final Map<String, String> values;
  AppLanguage(this.name, this.values);
}
