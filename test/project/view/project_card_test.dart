import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/features/project/view/widgets/project_card.dart';

import '../../../testing/models/mock_project.dart';

void main() {
  group('ProjectCard Widget Tests', () {
    const project = kProject;

    testWidgets('should display project details correctly',
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProjectCard(project: project),
          ),
        ),
      );

      // Assert
      expect(find.text('Project 1'), findsOneWidget);
      expect(find.text('Company 1'), findsOneWidget);
      expect(find.text('This is a test project description.'), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('should display an image with the correct asset path',
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProjectCard(project: project),
          ),
        ),
      );

      // Assert
      final imageFinder = find.byType(Image);
      final imageWidget = tester.widget<Image>(imageFinder);
      expect(
        (imageWidget.image as AssetImage).assetName,
        'assets/colartive/cover.png',
      );
    });

    testWidgets('should show fullscreen dialog on phone',
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MediaQuery(
              data:
                  MediaQueryData(size: Size(400, 800)), // Simulate phone screen
              child: ProjectCard(project: project),
            ),
          ),
        ),
      );

      // Act
      await tester.tap(find.byType(ProjectCard));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(Dialog), findsOneWidget);
      expect(find.byKey(const Key('project_detail_fullscreen_dialog')),
          findsOneWidget);
      expect(find.text('Project 1'), findsWidgets);
    });

    testWidgets('should show constrained dialog on larger screens',
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MediaQuery(
              data: MediaQueryData(
                  size: Size(1200, 800)), // Simulate larger screen
              child: ProjectCard(project: project),
            ),
          ),
        ),
      );

      // Act
      await tester.tap(find.byType(ProjectCard));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(Dialog), findsOneWidget);
      expect(find.byKey(const Key('project_detail_dialog')), findsOneWidget);
      expect(find.text('Project 1'), findsWidgets);
    });
  });
}
