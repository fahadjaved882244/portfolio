import 'package:flutter/foundation.dart';
import 'package:portfolio/core/app_error.dart';

@immutable
class Project {
  final String name;
  final String company;
  final String description;
  final String imageUrl;
  final String coverUrl;
  final String downloadUrl;
  final List<String> contributions;
  final List<String> challenges;
  final List<String> tools;

  const Project({
    required this.name,
    required this.company,
    required this.description,
    required this.imageUrl,
    required this.coverUrl,
    required this.downloadUrl,
    required this.contributions,
    required this.challenges,
    required this.tools,
  });

  Project copyWith({
    String? name,
    String? company,
    String? description,
    String? imageUrl,
    String? coverUrl,
    String? downloadUrl,
    List<String>? contributions,
    List<String>? challenges,
    List<String>? tools,
  }) {
    return Project(
      name: name ?? this.name,
      company: company ?? this.company,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      coverUrl: coverUrl ?? this.coverUrl,
      downloadUrl: downloadUrl ?? this.downloadUrl,
      contributions: contributions ?? this.contributions,
      challenges: challenges ?? this.challenges,
      tools: tools ?? this.tools,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'company': company,
      'description': description,
      'imageUrl': imageUrl,
      'coverUrl': coverUrl,
      'downloadUrl': downloadUrl,
      'contributions': contributions,
      'challenges': challenges,
      'tools': tools,
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('name') ||
        !map.containsKey('company') ||
        !map.containsKey('description') ||
        !map.containsKey('imageUrl') ||
        !map.containsKey('coverUrl') ||
        !map.containsKey('downloadUrl') ||
        !map.containsKey('contributions') ||
        !map.containsKey('challenges') ||
        !map.containsKey('tools')) {
      throw NotFoundError(
        'Map is missing required keys',
        stackTrace: StackTrace.current,
      );
    }
    if (map['name'].isEmpty ||
        map['company'].isEmpty ||
        map['description'].isEmpty) {
      throw NotFoundError(
        'Name, company, and description cannot be empty',
        stackTrace: StackTrace.current,
      );
    }

    // validete urls
    if (Uri.tryParse(map['imageUrl']) == null ||
        Uri.tryParse(map['coverUrl']) == null ||
        Uri.tryParse(map['downloadUrl']) == null) {
      throw NotFoundError(
        'ImageUrl, coverUrl, and downloadUrl must be valid URLs',
        stackTrace: StackTrace.current,
      );
    }

    if (map['contributions'] is! List<String> ||
        map['challenges'] is! List<String> ||
        map['tools'] is! List<String>) {
      throw NotFoundError(
        'Contributions, challenges, and tools must be lists of strings',
        stackTrace: StackTrace.current,
      );
    }

    return Project(
      name: map['name'],
      company: map['company'],
      description: map['description'],
      imageUrl: map['imageUrl'],
      coverUrl: map['coverUrl'],
      downloadUrl: map['downloadUrl'],
      contributions: List<String>.from(map['contributions']),
      challenges: List<String>.from(map['challenges']),
      tools: List<String>.from(map['tools']),
    );
  }

  @override
  String toString() {
    return 'Project(name: $name, company: $company, description: $description, imageUrl: $imageUrl, downloadUrl: $downloadUrl, contributions: $contributions, challenges: $challenges, tools: $tools)';
  }
}
