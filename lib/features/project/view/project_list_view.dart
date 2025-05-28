import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/core/app_strings.dart';
import 'package:portfolio/features/project/controller/project_controller.dart';
import 'package:portfolio/features/project/model/project_model.dart';
import 'package:portfolio/features/project/view/widgets/project_card.dart';

class ProjectListView extends ConsumerWidget {
  const ProjectListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncProjects = ref.watch(projectControllerProvider);

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
          child: buildBody(asyncProjects),
        ),
      ],
    );
  }

  Widget buildBody(AsyncValue<List<Project>> asyncValue) {
    return asyncValue.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (message, __) => const Center(
        child: Text("Unexpected Error! Please try again later."),
      ),
      data: (projects) => GridView.builder(
        padding: const EdgeInsets.only(left: 4, right: 4, bottom: 16),
        itemCount: projects.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 317,
          childAspectRatio: 0.60,
        ),
        itemBuilder: (context, i) {
          final project = projects[i];
          return ProjectCard(
            project: project,
          );
        },
      ),
    );
  }
}
