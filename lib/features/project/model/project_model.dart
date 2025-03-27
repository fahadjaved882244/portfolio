// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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

  Project({
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
    return Project(
      name: map['name'],
      company: map['company'],
      description: map['description'],
      imageUrl: map['imageUrl'] ?? "https://via.placeholder.com/800x400",
      coverUrl: map['coverUrl'] ?? "https://via.placeholder.com/800x400",
      downloadUrl: map['downloadUrl'],
      contributions: List<String>.from(map['contributions']),
      challenges: List<String>.from(map['challenges']),
      tools: List<String>.from(map['tools']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Project.fromJson(String source) =>
      Project.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Project(name: $name, company: $company, description: $description, imageUrl: $imageUrl, downloadUrl: $downloadUrl, contributions: $contributions, challenges: $challenges, tools: $tools)';
  }
}
