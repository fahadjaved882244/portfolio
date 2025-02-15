import 'dart:ui';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final localDbProvider = Provider<LocalDb>((ref) {
  final sharedPrefs = ref.read(sharedPreferencesProvider);
  return LocalDb(sharedPrefs);
});

class LocalDb {
  final SharedPreferences _box;
  LocalDb(this._box);

  static const _darkModeKey = 'isDarkMode';

  /// Load isDarkMode from local storage and if it's empty, returns true (that means default theme is dark)
  bool get isDarkMode => _box.getBool(_darkModeKey) ?? false;

  /// Save to local storage
  set isDarkMode(bool flag) => _box.setBool(_darkModeKey, flag);

  //////////////////////////
  ///////// Locale /////////
  /////////////////////////
  static const _languageKey = 'locale_language';
  static const _countryKey = 'locale_country';

  Locale get locale => Locale(
        _box.getString(_languageKey) ?? 'en',
        _box.getString(_countryKey),
      );

  /// Save locale to local storage
  void saveLanguageCode(Locale locale) {
    _box.setString(_languageKey, locale.languageCode);
    if (locale.countryCode != null) {
      _box.setString(_countryKey, locale.countryCode!);
    }
  }
}
