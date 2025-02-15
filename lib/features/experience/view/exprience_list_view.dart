import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/core/app_strings.dart';
import 'package:portfolio/features/experience/controller/experience_controller.dart';
import 'package:portfolio/features/experience/view/widgets/experience_card.dart';

class ExperienceListView extends ConsumerWidget {
  const ExperienceListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final experiences = ref.watch(experienceControllerProvider);

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 48),

          // Name
          Text(
            AppStrings.experienceTitle,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),

          // Expertise
          Text(
            AppStrings.experienceTags,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.grey[600],
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),

          Text(
            AppStrings.experienceSummary,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),

          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 480,
            ),
            child: Column(
              children: ListTile.divideTiles(
                context: context,
                tiles: experiences.map(
                  (e) => ExperienceCard(experience: e),
                ),
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
