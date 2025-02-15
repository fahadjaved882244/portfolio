import 'package:flutter/material.dart';
import 'package:portfolio/features/project/model/project_model.dart';
import 'package:portfolio/features/project/view/components/project_card.dart';

class ProjectView extends StatelessWidget {
  const ProjectView({super.key});

  @override
  Widget build(BuildContext context) {
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
