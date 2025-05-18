import 'package:flutter/material.dart';
import 'package:portfolio/features/responsive/model/destination.dart';

class CustomNavMenu extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  const CustomNavMenu({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo
            Text(
              'MyWebsite',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            // Navigation Menu
            Row(
              children: myDestinations
                  .map((d) => _buildNavItem(
                        d.label,
                        myDestinations.indexOf(d),
                        context,
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String title, int index, BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => print('$title hovered'), // Optional: Handle hover logic
      onExit: (_) => print('$title unhovered'), // Optional: Handle hover logic
      child: GestureDetector(
        onTap: () => onDestinationSelected(index),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(vertical: 2),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: selectedIndex == index
                      ? Theme.of(context).colorScheme.primary
                      : Colors.transparent,
                  width: 2,
                ),
              ),
            ),
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: selectedIndex == index
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onSurface,
                    fontWeight: selectedIndex == index
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
