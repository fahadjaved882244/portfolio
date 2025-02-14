import 'package:flutter/material.dart';
import 'package:portfolio/views/home/components/destination.dart';

class CustomNavRail extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final Color? backgroundColor;

  const CustomNavRail({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      child: NavigationRail(
        backgroundColor: backgroundColor,
        groupAlignment: 0.0,
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: myDestinations.map((d) {
          return NavigationRailDestination(
            icon: Icon(d.icon),
            label: Text(d.label),
          );
        }).toList(),
      ),
    );
  }
}
