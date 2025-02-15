import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/features/project/controller/project_controller.dart';
import 'package:portfolio/features/project/view/widgets/project_card.dart';

class ProjectView extends ConsumerWidget {
  const ProjectView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myProjects = ref.watch(projectControllerProvider);

    return CustomScrollView(
      slivers: [
        SliverAppBar.large(
          title: Text(
            "My recent projects",
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        SliverGrid.builder(
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
      ],
    );
  }
}
