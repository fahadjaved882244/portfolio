import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/features/project/controller/project_controller.dart';
import 'package:portfolio/features/project/model/project_model.dart';
import 'package:portfolio/features/project/repository/local_project_repository.dart';

void main() {
  late ProviderContainer container;
  late LocalProjectRepository mockRepository;

  setUp(() {
    mockRepository = LocalProjectRepository();
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
      final mockProjects = [
        Project(
          name: 'Test Project',
          company: 'Test Company',
          description: 'This is a test project.',
          imageUrl: 'https://example.com/image.png',
          coverUrl: 'https://example.com/cover.png',
          downloadUrl: 'https://example.com/download',
          contributions: ['Contribution 1', 'Contribution 2'],
          challenges: ['Challenge 1', 'Challenge 2'],
          tools: ['Tool 1', 'Tool 2'],
        ),
      ];
      mockRepository.fetchProjects = () async => mockProjects;

      // Act
      final result = await container.read(projectControllerProvider.future);

      // Assert
      expect(result, isA<List<Project>>());
      expect(result, mockProjects);
    });

    test('should handle empty project list gracefully', () async {
      // Arrange
      mockRepository.fetchProjects = () async => [];

      // Act
      final result = await container.read(projectControllerProvider.future);

      // Assert
      expect(result, isEmpty);
    });

    test('should throw an exception when fetchProjects fails', () async {
      // Arrange
      mockRepository.fetchProjects = () async {
        throw Exception('Failed to fetch projects');
      };

      // Act
      final future = container.read(projectControllerProvider.future);

      // Assert
      await expectLater(future, throwsA(isA<Exception>()));
    });

    test('should update state when new data is fetched', () async {
      // Arrange
      final initialProjects = [
        Project(
          name: 'Initial Project',
          company: 'Initial Company',
          description: 'This is the initial project.',
          imageUrl: 'https://example.com/image1.png',
          coverUrl: 'https://example.com/cover1.png',
          downloadUrl: 'https://example.com/download1',
          contributions: ['Contribution 1'],
          challenges: ['Challenge 1'],
          tools: ['Tool 1'],
        ),
      ];
      final updatedProjects = [
        Project(
          name: 'Updated Project',
          company: 'Updated Company',
          description: 'This is the updated project.',
          imageUrl: 'https://example.com/image2.png',
          coverUrl: 'https://example.com/cover2.png',
          downloadUrl: 'https://example.com/download2',
          contributions: ['Contribution 2'],
          challenges: ['Challenge 2'],
          tools: ['Tool 2'],
        ),
      ];
      mockRepository.fetchProjects = () async => initialProjects;

      // Act
      final initialResult =
          await container.read(projectControllerProvider.future);
      expect(initialResult, initialProjects);

      mockRepository.fetchProjects = () async => updatedProjects;
      container.refresh(projectControllerProvider);
      final updatedResult =
          await container.read(projectControllerProvider.future);

      // Assert
      expect(updatedResult, updatedProjects);
    });
  });
}
