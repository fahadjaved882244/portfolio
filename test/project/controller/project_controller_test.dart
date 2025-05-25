import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/features/project/controller/project_controller.dart';
import 'package:portfolio/features/project/model/project_model.dart';
import 'package:portfolio/features/project/repository/local_project_repository.dart';

import '../../../testing/mocks/mock_project_repository.dart';
import '../../../testing/models/mock_project.dart';

void main() {
  late ProviderContainer container;
  late MockProjectRepository mockRepository;

  setUp(() {
    mockRepository = MockProjectRepository();
    container = ProviderContainer(
      overrides: [
        projectRepositoryProvider.overrideWithValue(mockRepository),
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
      mockRepository.fetchProjectsCallback = () async => mockProjects;

      // Act
      final result = await container.read(projectControllerProvider.future);

      // Assert
      expect(result, isA<List<Project>>());
      expect(result, mockProjects);
    });

    test('should handle empty project list gracefully', () async {
      // Arrange
      mockRepository.fetchProjectsCallback = () async => [];

      // Act
      final result = await container.read(projectControllerProvider.future);

      // Assert
      expect(result, isEmpty);
    });

    test('should throw an exception when fetchProjects fails', () async {
      // Arrange
      mockRepository.fetchProjectsCallback = () async {
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
      mockRepository.fetchProjectsCallback = () async => initialProjects;

      // Act
      final initialResult =
          await container.read(projectControllerProvider.future);
      expect(initialResult, initialProjects);

      mockRepository.fetchProjectsCallback = () async => updatedProjects;
      container.refresh(projectControllerProvider);
      final updatedResult =
          await container.read(projectControllerProvider.future);

      // Assert
      expect(updatedResult, updatedProjects);
    });
  });
}
