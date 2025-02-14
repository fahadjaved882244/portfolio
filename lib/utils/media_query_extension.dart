import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  bool get isPhone => width < 600;
  bool get isTablet => width >= 600 && width < 1440;
  bool get isDesktop => width >= 1440;

  double get margin {
    switch (width) {
      case < 600:
        return 16;
      case >= 600 && < 905:
        return 32;
      case >= 905 && < 1240:
        return 32;
      case >= 1240 && < 1440:
        return 200;
      case >= 1440:
        return 200;
      default:
        return 16;
    }
  }

  double get bodySize {
    switch (width) {
      case < 600:
        return 0.0;
      case >= 600 && < 905:
        return 0.0;
      case >= 905 && < 1240:
        return 840;
      case >= 1240 && < 1440:
        return double.infinity;
      case >= 1440:
        return 1040;
      default:
        return 16;
    }
  }

  double get bodySizeMax {
    switch (width) {
      case < 600:
        return double.infinity;
      case >= 600 && < 905:
        return double.infinity;
      case >= 905 && < 1240:
        return 840;
      case >= 1240 && < 1440:
        return double.infinity;
      case >= 1440:
        return 1040;
      default:
        return 16;
    }
  }
}
