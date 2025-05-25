import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/core/app_error.dart';
import 'package:portfolio/features/project/model/project_model.dart';

void main() {
  group('Project Model', () {
    const project = Project(
      name: 'Test Project',
      company: 'Test Company',
      description: 'This is a test project.',
      imageUrl: 'https://example.com/image.png',
      coverUrl: 'https://example.com/cover.png',
      downloadUrl: 'https://example.com/download',
      contributions: ['Contribution 1', 'Contribution 2'],
      challenges: ['Challenge 1', 'Challenge 2'],
      tools: ['Tool 1', 'Tool 2'],
    );

    test('toMap should convert Project to a valid map', () {
      // Act
      final map = project.toMap();

      // Assert
      expect(map, isA<Map<String, dynamic>>());
      expect(map['name'], project.name);
      expect(map['company'], project.company);
      expect(map['description'], project.description);
      expect(map['imageUrl'], project.imageUrl);
      expect(map['coverUrl'], project.coverUrl);
      expect(map['downloadUrl'], project.downloadUrl);
      expect(map['contributions'], project.contributions);
      expect(map['challenges'], project.challenges);
      expect(map['tools'], project.tools);
    });

    test('fromMap should create a valid Project from a map', () {
      // Arrange
      final map = {
        'name': 'Test Project',
        'company': 'Test Company',
        'description': 'This is a test project.',
        'imageUrl': 'https://example.com/image.png',
        'coverUrl': 'https://example.com/cover.png',
        'downloadUrl': 'https://example.com/download',
        'contributions': ['Contribution 1', 'Contribution 2'],
        'challenges': ['Challenge 1', 'Challenge 2'],
        'tools': ['Tool 1', 'Tool 2'],
      };

      // Act
      final result = Project.fromMap(map);

      // Assert
      expect(result, isA<Project>());
      expect(result.name, map['name']);
      expect(result.company, map['company']);
      expect(result.description, map['description']);
      expect(result.imageUrl, map['imageUrl']);
      expect(result.coverUrl, map['coverUrl']);
      expect(result.downloadUrl, map['downloadUrl']);
      expect(result.contributions, map['contributions']);
      expect(result.challenges, map['challenges']);
      expect(result.tools, map['tools']);
    });

    test('fromMap should throw NotFoundError for missing required fields', () {
      // Arrange
      final map = {
        'name': 'Test Project',
        'company': 'Test Company',
        // 'description' is missing
        'imageUrl': 'https://example.com/image.png',
        'coverUrl': 'https://example.com/cover.png',
        'downloadUrl': 'https://example.com/download',
        'contributions': ['Contribution 1', 'Contribution 2'],
        'challenges': ['Challenge 1', 'Challenge 2'],
        'tools': ['Tool 1', 'Tool 2'],
      };

      // Act & Assert
      expect(() => Project.fromMap(map), throwsA(isA<NotFoundError>()));
    });

    // test for handling list fields with null values
    test('fromMap should throw NotFoundError for required List fields', () {
      // Arrange
      final map = {
        'name': 'Test Project',
        'company': 'Test Company',
        'description': 'This is a test project.',
        'imageUrl': 'https://example.com/image.png',
        'coverUrl': 'https://example.com/cover.png',
        'downloadUrl': 'https://example.com/download',
        'contributions':
            "A list of contributions", // contributions is string not list
        'challenges': ['Challenge 1', 'Challenge 2'],
        'tools': ['Tool 1', 'Tool 2'],
      };
      // Act & Assert
      expect(() => Project.fromMap(map), throwsA(isA<NotFoundError>()));
    });

    test('fromMap should handle missing optional fields gracefully', () {
      // Arrange
      final map = {
        'name': 'Test Project',
        'company': 'Test Company',
        'description': 'This is a test project.',
        'imageUrl': null,
        'coverUrl': null,
        'downloadUrl': 'https://example.com/download',
        'contributions': ['Contribution 1', 'Contribution 2'],
        'challenges': ['Challenge 1', 'Challenge 2'],
        'tools': ['Tool 1', 'Tool 2'],
      };

      // Act
      final result = Project.fromMap(map);

      // Assert
      expect(result.imageUrl, 'https://via.placeholder.com/800x400');
      expect(result.coverUrl, 'https://via.placeholder.com/800x400');
    });

    test('copyWith should create a new Project with updated fields', () {
      // Act
      final updatedProject = project.copyWith(
        name: 'Updated Project',
        company: 'Updated Company',
      );

      // Assert
      expect(updatedProject.name, 'Updated Project');
      expect(updatedProject.company, 'Updated Company');
      expect(updatedProject.description, project.description);
    });

    test('copyWith should retain original values if no fields are updated', () {
      // Act
      final copiedProject = project.copyWith();

      // Assert
      expect(copiedProject.name, project.name);
      expect(copiedProject.company, project.company);
      expect(copiedProject.description, project.description);
      expect(copiedProject.imageUrl, project.imageUrl);
      expect(copiedProject.coverUrl, project.coverUrl);
      expect(copiedProject.downloadUrl, project.downloadUrl);
      expect(copiedProject.contributions, project.contributions);
      expect(copiedProject.challenges, project.challenges);
      expect(copiedProject.tools, project.tools);
    });

    test('toString should return a valid string representation of the Project',
        () {
      // Act
      final stringRepresentation = project.toString();

      // Assert
      expect(stringRepresentation, contains('Test Project'));
      expect(stringRepresentation, contains('Test Company'));
      expect(stringRepresentation, contains('This is a test project.'));
    });
  });
}
