import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  bool get isPhone => width < 600;
  bool get isTablet => width >= 600 && width < 1440;
  bool get isDesktop => width >= 1440;

  bool get showRail => isTablet || isDesktop;

  double get margin {
    switch (width) {
      case < 600:
        return 16;
      case >= 600 && < 905:
        return 32;
      case >= 905 && < 1240:
        return (width - 840) / 2;
      case >= 1240 && < 1440:
        return 200;
      case >= 1440:
        return (width - 1040) / 2;
      default:
        return 16;
    }
  }

  double get bodySize {
    switch (width) {
      case < 600:
        return width - 16 * 2;
      case >= 600 && < 905:
        return width - (32 * 2);
      case >= 905 && < 1240:
        return 840;
      case >= 1240 && < 1440:
        return width - (200 * 2);
      case >= 1440:
        return 1040;
      default:
        return 16;
    }
  }
}
