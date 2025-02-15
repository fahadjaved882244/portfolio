import 'package:flutter/material.dart';
import 'package:portfolio/features/responsive/model/destination.dart';

class CustomDrawer extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const CustomDrawer({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });
  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
          child: Text('Header', style: Theme.of(context).textTheme.titleSmall),
        ),
        ...myDestinations.map((destination) {
          return NavigationDrawerDestination(
            label: Text(destination.label),
            icon: Icon(destination.icon),
          );
        }),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),
      ],
    );
  }
}
