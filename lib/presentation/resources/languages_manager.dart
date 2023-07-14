import 'package:advanced_flutter_course/app/constants.dart';

enum LanguageManager {
  english,
  arabic,
}

extension LanguageManagerExtension on LanguageManager {
  String getValue() {
    switch(this) {
      case LanguageManager.english:
        return Constant.english;
      case LanguageManager.arabic:
        return Constant.arabic;
    }
  }
}
