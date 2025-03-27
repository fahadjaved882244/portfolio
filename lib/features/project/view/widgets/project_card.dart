import 'package:flutter/material.dart';
import 'package:portfolio/features/project/model/project_model.dart';
import 'package:portfolio/features/project/view/project_detail_view.dart';
import 'package:portfolio/features/responsive/utils/media_query_extension.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      child: LayoutBuilder(builder: (context, constraints) {
        return InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  final content = ProjectDetailView(
                    project: project,
                  );
                  // show Full Screen Dialog on phone because it can cover the whole
                  // screen.
                  if (context.isPhone) {
                    return Dialog.fullscreen(
                      child: content,
                    );
                  } else {
                    return Dialog(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 400),
                        child: content,
                      ),
                    );
                  }
                });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: constraints.maxHeight * 0.65,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(16),
                  ),
                  child: Image.asset(
                    project.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project.name,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      project.company,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      project.description,
                      style: Theme.of(context).textTheme.labelMedium,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
