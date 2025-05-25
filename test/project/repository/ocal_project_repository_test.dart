import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/features/project/model/project_model.dart';
import 'package:portfolio/features/project/repository/local_project_repository.dart';

void main() {
  late LocalProjectRepository repository;

  setUp(() {
    repository = LocalProjectRepository();
  });

  group('LocalProjectRepository', () {
    test('fetchProjects should return a non-empty list of projects', () async {
      // Act
      final projects = await repository.fetchProjects();

      // Assert
      expect(projects, isNotEmpty);
    });

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

    // test the imageUrl and coverUrl fields are a valid URL
    test('fetchProjects should have valid imageUrl, coverUrl and downloadUrl',
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

    // test('fetchProjects should handle empty JSON data gracefully', () async {
    //   // Arrange
    //   const emptyJsonProjects = <Map<String, dynamic>>[];
    //   final repository = LocalProjectRepository();
    //   final originalJsonProjects = _jsonProjects; // Save original data
    //   _jsonProjects.clear(); // Temporarily clear the data

    //   // Act
    //   final projects = await repository.fetchProjects();

    //   // Assert
    //   expect(projects, isEmpty);

    //   // Restore original data
    //   _jsonProjects.addAll(originalJsonProjects);
    // });

    // test('fetchProjects should handle malformed JSON data gracefully',
    //     () async {
    //   // Arrange
    //   const malformedJsonProjects = [
    //     {"name": "Invalid Project"} // Missing required fields
    //   ];
    //   final repository = LocalProjectRepository();
    //   final originalJsonProjects = _jsonProjects; // Save original data
    //   _jsonProjects.clear(); // Temporarily clear the data
    //   _jsonProjects.addAll(malformedJsonProjects);

    //   // Act
    //   try {
    //     await repository.fetchProjects();
    //     fail('fetchProjects should throw an exception for malformed data');
    //   } catch (e) {
    //     // Assert
    //     expect(e, isA<Exception>());
    //   } finally {
    //     // Restore original data
    //     _jsonProjects.clear();
    //     _jsonProjects.addAll(originalJsonProjects);
    //   }
    // });
  });
}
