import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/features/project/controller/project_controller.dart';
import 'package:portfolio/features/project/model/project_model.dart';
import 'package:portfolio/features/project/view/project_list_view.dart';
import 'package:portfolio/features/project/view/widgets/project_card.dart';

import '../../../testing/models/mock_project.dart';

void main() {
  group('ProjectListView Widget Tests', () {
    final mockProjects = [
      kProject,
      kProject.copyWith(name: 'Project 2', company: 'Company 2'),
    ];

    testWidgets('should display a loading indicator when AsyncValue is loading',
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            projectControllerProvider.overrideWith(
              (ref) {
                return Future.delayed(
                  const Duration(seconds: 2),
                  () => <Project>[],
                );
              },
            ),
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: ProjectListView(),
            ),
          ),
        ),
      );

      // Assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('should display an error message when AsyncValue has an error',
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            projectControllerProvider.overrideWith(
              (ref) {
                return Future<List<Project>>.error('Failed to load projects');
              },
            ),
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: ProjectListView(),
            ),
          ),
        ),
      );

      // Allow time for the error to be processed
      await tester.pump(const Duration(seconds: 1));

      // Assert
      expect(
        find.text('Unexpected Error! Please try again later.'),
        findsOneWidget,
      );
    });

    testWidgets('should display a grid of projects when AsyncValue has data',
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            projectControllerProvider.overrideWith(
              (ref) => Future.value(mockProjects),
            ),
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: ProjectListView(),
            ),
          ),
        ),
      );

      // Allow time for the data to be processed
      await tester.pump();

      // Assert
      expect(find.byType(GridView), findsOneWidget);
      expect(find.text('Project 1'), findsOneWidget);
      expect(find.text('Project 2'), findsOneWidget);
      expect(find.byType(ProjectCard), findsNWidgets(mockProjects.length));
    });
  });
}
