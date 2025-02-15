import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/features/local_db/local_db.dart';

final themeControllerProvider =
    StateNotifierProvider<ThemeController, ThemeMode>((ref) {
  final storage = ref.read(localDbProvider);
  return ThemeController(storage);
});

class ThemeController extends StateNotifier<ThemeMode> {
  final LocalDb _localDb;
  ThemeController(this._localDb) : super(ThemeMode.light);

  /// Get info from local storage and return ThemeMode
  ThemeMode get themeMode => state;

  void toggleThemeMode() {
    if (brightness == Brightness.light) {
      state = ThemeMode.dark;
      _localDb.isDarkMode = true;
    } else {
      state = ThemeMode.light;
      _localDb.isDarkMode = false;
    }
  }

  Brightness get brightness {
    switch (themeMode) {
      case ThemeMode.system:
        return SchedulerBinding.instance.platformDispatcher.platformBrightness;
      case ThemeMode.dark:
        return Brightness.dark;
      case ThemeMode.light:
        return Brightness.light;
      default:
        return Brightness.dark;
    }
  }
}
