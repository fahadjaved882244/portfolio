import 'package:flutter/material.dart';
import 'package:portfolio/components/animations.dart';
import 'package:portfolio/views/home/components/destination.dart';

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final BarAnimation barAnimation;
  final Color? backgroundColor;
  const CustomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.barAnimation,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      elevation: 0,
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      backgroundColor: backgroundColor,
      destinations: myDestinations.map((d) {
        return NavigationDestination(
          icon: Icon(d.icon),
          label: d.label,
        );
      }).toList(),
    );
  }
}
