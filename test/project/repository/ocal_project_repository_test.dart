import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/features/project/model/project_model.dart';
import 'package:portfolio/features/project/repository/local_project_repository.dart';

import '../../../testing/mocks/mock_local_db.dart';

void main() {
  late LocalProjectRepository repository;
  late MockLocalDb mockLocalDb;

  setUp(() {
    mockLocalDb = MockLocalDb();
    repository = LocalProjectRepository(mockLocalDb);
  });

  group('LocalProjectRepository', () {
    test('fetchProjects should return a list of Project objects', () async {
      // Act
      final projects = await repository.fetchProjects();

      // Assert
      expect(projects, isA<List<Project>>());
    });

    test('fetchProjects should return projects with valid fields', () async {
      // Act
      final projects = await repository.fetchProjects();

      // Assert
      for (final project in projects) {
        expect(project, isA<Project>());
        expect(project.name, isNotEmpty);
        expect(project.company, isNotEmpty);
        expect(project.description, isNotEmpty);
        expect(project.imageUrl, isNotEmpty);
        expect(project.coverUrl, isNotEmpty);
        expect(project.downloadUrl, isNotEmpty);
        expect(project.contributions, isNotEmpty);
        expect(project.challenges, isNotEmpty);
        expect(project.tools, isNotEmpty);
      }
    });

    test('fetchProjects should have valid imageUrl, coverUrl, and downloadUrl',
        () async {
      // Act
      final projects = await repository.fetchProjects();

      // Assert
      for (final project in projects) {
        expect(Uri.tryParse(project.imageUrl), isNotNull);
        expect(Uri.tryParse(project.coverUrl), isNotNull);
        expect(Uri.tryParse(project.downloadUrl), isNotNull);
      }
    });

    test('fetchProjects should handle empty JSON data gracefully', () async {
      // Arrange
      mockLocalDb.getProjectsCallback = () => [];

      // Act
      final projects = await repository.fetchProjects();

      // Assert
      expect(projects, isEmpty);
    });

    test('fetchProjects should throw an exception for malformed data',
        () async {
      // Arrange
      mockLocalDb.getProjectsCallback = () => [
            {"name": "Invalid Project"} // Missing required fields
          ];

      // Act & Assert
      expect(() async => await repository.fetchProjects(),
          throwsA(isA<Exception>()));
    });
  });
}
