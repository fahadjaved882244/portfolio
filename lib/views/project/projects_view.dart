import 'package:flutter/material.dart';
import 'package:portfolio/components/outline_container.dart';

class Project {
  final String name;
  final String imageUrl;
  final String downloadUrl;

  Project({
    required this.name,
    required this.imageUrl,
    required this.downloadUrl,
  });
}

final myProjects = [
  Project(
    name: "Shared Smiles",
    imageUrl: "",
    downloadUrl: "",
  ),
  Project(
    name: "Food Delivery",
    imageUrl: "",
    downloadUrl: "",
  ),
  Project(
    name: "Lead Management",
    imageUrl: "",
    downloadUrl: "",
  ),
];

class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar.large(
          title: Text("Browse my recent Projects"),
        ),
        SliverGrid.builder(
          itemCount: myProjects.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 520,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, i) {
            final project = myProjects[i];
            return Card.outlined(
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 280,
                    color: Colors.cyan.shade400,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          project.name,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Row(
                          children: [
                            FilledButton.tonal(
                              onPressed: () {},
                              child: Text("Download"),
                            ),
                            SizedBox(width: 8),
                            OutlinedButton(
                              onPressed: () {},
                              child: Text("Learn More"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
