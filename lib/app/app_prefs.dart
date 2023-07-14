import 'package:advanced_flutter_course/app/constants.dart';
import 'package:advanced_flutter_course/presentation/resources/languages_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(Constant.preferredKeyLanguage);

    if(language != null && language.isNotEmpty){
      return language;
    }
    else {
      return LanguageManager.english.getValue();
    }
  }
}
