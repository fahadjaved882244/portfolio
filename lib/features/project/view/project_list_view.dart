import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/core/app_strings.dart';
import 'package:portfolio/features/project/controller/project_controller.dart';
import 'package:portfolio/features/project/view/widgets/project_card.dart';

class ProjectListView extends ConsumerWidget {
  const ProjectListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myProjects = ref.watch(projectControllerProvider);

    return Column(
      children: [
        const SizedBox(height: 48),
        // Name
        Text(
          AppStrings.projectTitle,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),

        // Expertise
        Text(
          AppStrings.projectTags,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.grey[600],
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),

        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.only(left: 4, right: 4, bottom: 16),
            itemCount: myProjects.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 317,
              childAspectRatio: 0.60,
            ),
            itemBuilder: (context, i) {
              final project = myProjects[i];
              return ProjectCard(
                project: project,
              );
            },
          ),
        ),
      ],
    );
  }
}
