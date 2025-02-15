import 'package:flutter/material.dart';

class SkillsTable extends StatelessWidget {
  const SkillsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      columnWidths: const {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1),
        3: FlexColumnWidth(1),
        4: FlexColumnWidth(1),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiaryContainer,
          ),
          children: [
            ...[
              'Planning',
              'Design',
              'Coding',
              'Testing',
              'Deployment',
            ].map(
              (e) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  e,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                  ),
                ),
              ),
            ),
          ],
        ),
        _buildTableRow([
          'Jira',
          'Figma',
          'Flutter',
          'Widget',
          'Play Store',
        ]),
        _buildTableRow([
          'Trello',
          'UML Diagrams',
          'REST API',
          'Integration',
          'App Store',
        ]),
        _buildTableRow([
          'Git',
          'DB Schema',
          'Google Cloud',
          'Postman',
          'GitHub Actions',
        ]),
        _buildTableRow(
          [
            'MS Word',
            'Responsive Design',
            'Azure Services',
            'Dev Tools',
            'CI/CD',
          ],
        ),
      ],
    );
  }

  TableRow _buildTableRow(List<String> skills) {
    return TableRow(
      children: skills.map((s) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(s),
        );
      }).toList(),
    );
  }
}
