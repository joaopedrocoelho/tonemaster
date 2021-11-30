import 'package:shared_preferences/shared_preferences.dart';

class UserSettings {
  static late SharedPreferences _preferences;

  static const _keyQuizSize = 'quizsize';
  static const _keyCharacters = 'characters';
  static const _keyTones = 'tones';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setQuizSize(int size) async =>
      await _preferences.setInt(_keyQuizSize, size);

  static Future setCharacters(bool traditional) async =>
      await _preferences.setBool(_keyCharacters, traditional);

  static Future setTones(bool twTones) async =>
      await _preferences.setBool(_keyTones, twTones);

  static int? getQuizSize() => _preferences.getInt(_keyQuizSize);
  static bool? getCharacters() => _preferences.getBool(_keyCharacters);
  static bool? getTones() => _preferences.getBool(_keyTones);
  
}
