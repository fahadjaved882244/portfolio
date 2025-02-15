import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final responsiveIndexProvider =
    NotifierProvider<ResponsiveIndexNotifier, int>(() {
  return ResponsiveIndexNotifier();
});

class ResponsiveIndexNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  set index(int i) => state = i;

  Color get themeSeedColor {
    if (state == 0) {
      return Colors.red;
    }
    if (state == 1) {
      return Colors.green;
    }
    if (state == 2) {
      return Colors.deepPurple;
    }
    if (state == 3) {
      return Colors.deepOrange;
    }
    return Colors.deepPurple;
  }
}
