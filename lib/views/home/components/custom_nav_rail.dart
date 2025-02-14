import 'package:flutter/material.dart';
import 'package:portfolio/components/animations.dart';
import 'package:portfolio/utils/media_query_extension.dart';
import 'package:portfolio/animations/nav_rail_trans.dart';
import 'package:portfolio/views/home/components/destination.dart';

class CustomNavRail extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final RailAnimation railAnimation;
  final Color? backgroundColor;

  const CustomNavRail({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.railAnimation,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.isDesktop ? 256 : 72,
      child: NavRailTransition(
        animation: railAnimation,
        backgroundColor: backgroundColor,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: NavigationRail(
            backgroundColor: backgroundColor,
            groupAlignment: 0.0,
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            extended: context.isDesktop,
            destinations: destinations.map((d) {
              return NavigationRailDestination(
                icon: Icon(d.icon),
                label: Text(d.label),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
