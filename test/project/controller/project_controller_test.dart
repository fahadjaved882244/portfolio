import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/features/project/controller/project_controller.dart';
import 'package:portfolio/features/project/model/project_model.dart';
import 'package:portfolio/features/project/repository/local_project_repository.dart';

import '../../../testing/mocks/mock_project_repository.dart';
import '../../../testing/models/mock_project.dart';

void main() {
  late ProviderContainer container;
  late MockProjectRepository projectRepository;

  setUp(() {
    projectRepository = MockProjectRepository();
    container = ProviderContainer(
      overrides: [
        projectRepositoryProvider.overrideWithValue(projectRepository),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('ProjectController', () {
    test('should return a list of projects when fetchProjects succeeds',
        () async {
      // Arrange
      final mockProjects = [kProject];
      projectRepository.fetchProjectsCallback = () async => mockProjects;

      // Act
      final result = await container.read(projectControllerProvider.future);

      // Assert
      expect(result, isA<List<Project>>());
      expect(result, mockProjects);
    });

    test('should handle empty project list gracefully', () async {
      // Arrange
      projectRepository.fetchProjectsCallback = () async => [];

      // Act
      final result = await container.read(projectControllerProvider.future);

      // Assert
      expect(result, isEmpty);
    });

    test('should throw an exception when fetchProjects fails', () async {
      // Arrange
      projectRepository.fetchProjectsCallback = () async {
        throw Exception('Failed to fetch projects');
      };

      // Act
      final future = container.read(projectControllerProvider.future);

      // Assert
      await expectLater(future, throwsA(isA<Exception>()));
    });

    test('should update state when new data is fetched', () async {
      // Arrange
      final initialProjects = [kProject];
      final updatedProjects = [
        kProject.copyWith(name: 'Updated Project', company: 'Updated Company')
      ];
      projectRepository.fetchProjectsCallback = () async => initialProjects;

      // Act
      final initialResult =
          await container.read(projectControllerProvider.future);
      expect(initialResult, initialProjects);

      projectRepository.fetchProjectsCallback = () async => updatedProjects;
      container.refresh(projectControllerProvider);
      final updatedResult =
          await container.read(projectControllerProvider.future);

      // Assert
      expect(updatedResult, updatedProjects);
    });
  });
}
