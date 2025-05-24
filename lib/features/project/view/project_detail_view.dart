import 'package:flutter/material.dart';
import 'package:portfolio/features/project/model/project_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailView extends StatelessWidget {
  final Project project;

  const ProjectDetailView({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    const snackBar = SnackBar(content: Text("Requested URL not found!"));

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Image
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(24)),
                  child: Image.asset(
                    project.coverUrl,
                    height: 400,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Project Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.name,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),

                  // Company Name
                  Text(
                    project.company,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),

                  // Project Description
                  Text(
                    project.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),

                  // Technologies Used
                  Text(
                    'Technologies Used',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: project.tools
                        .map((tool) => _buildTechnologyChip(tool))
                        .toList(),
                  ),
                  const SizedBox(height: 16),

                  // Key Contributions
                  Text(
                    'Key Contributions',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ...project.contributions.map((c) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        "⭐ $c",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    );
                  }),
                  const SizedBox(height: 16),

                  // Key Contributions
                  Text(
                    'Challenges Faced',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ...project.challenges.map((c) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        "⭐ $c",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    );
                  }),
                  const SizedBox(height: 24),

                  // Project Link

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FilledButton.tonalIcon(
                        onPressed: () async {
                          // Open Project Link
                          try {
                            final uri = Uri.parse(project.downloadUrl);
                            if (await canLaunchUrl(uri)) {
                              launchUrl(uri);
                            }
                          } catch (e) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          }
                        },
                        label: const Text('View Project'),
                        icon: const Icon(Icons.open_in_new),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build technology chips
  Widget _buildTechnologyChip(String technology) {
    return Chip(
      label: Text(technology),
    );
  }
}
