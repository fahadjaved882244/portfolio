import 'package:flutter/material.dart';

class OutlineContainer extends StatelessWidget {
  final Widget child;

  const OutlineContainer({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(24),
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}
