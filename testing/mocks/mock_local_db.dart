import 'dart:ui';

import 'package:portfolio/data/local_db.dart';

class MockLocalDb implements LocalDb {
  @override
  List<Map<String, dynamic>> getProjects() {
    return [];
  }

  @override
  bool get darkMode => false;

  @override
  set darkMode(bool value) {}

  @override
  Locale get locale => const Locale('en', 'US');

  @override
  set locale(Locale value) {}
}
