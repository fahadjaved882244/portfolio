// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Project {
  final String name;
  final String company;
  final String description;
  final String imageUrl;
  final String downloadUrl;

  Project({
    required this.name,
    required this.company,
    required this.description,
    required this.imageUrl,
    required this.downloadUrl,
  });

  Project copyWith({
    String? name,
    String? company,
    String? description,
    String? imageUrl,
    String? downloadUrl,
  }) {
    return Project(
      name: name ?? this.name,
      company: company ?? this.company,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      downloadUrl: downloadUrl ?? this.downloadUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'company': company,
      'description': description,
      'imageUrl': imageUrl,
      'downloadUrl': downloadUrl,
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      name: map['name'] as String,
      company: map['company'] as String,
      description: map['description'] as String,
      imageUrl: map['imageUrl'] as String,
      downloadUrl: map['downloadUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Project.fromJson(String source) =>
      Project.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Project(name: $name, company: $company, description: $description, imageUrl: $imageUrl, downloadUrl: $downloadUrl)';
  }

  @override
  bool operator ==(covariant Project other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.company == company &&
        other.description == description &&
        other.imageUrl == imageUrl &&
        other.downloadUrl == downloadUrl;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        company.hashCode ^
        description.hashCode ^
        imageUrl.hashCode ^
        downloadUrl.hashCode;
  }
}

final myProjects = [
  Project(
    name: "Shared Smiles",
    company: "Exacology",
    description:
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
    imageUrl: "",
    downloadUrl: "",
  ),
  Project(
    name: "Food Delivery",
    company: "Ng Solutions",
    description:
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
    imageUrl: "",
    downloadUrl: "",
  ),
  Project(
    name: "Colartive",
    company: "Personal Project",
    description:
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
    imageUrl: "",
    downloadUrl: "",
  ),
  Project(
    name: "Lead Manager",
    company: "Personal",
    description:
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
    imageUrl: "",
    downloadUrl: "",
  ),
  Project(
    name: "Psychometrica",
    company: "Exacology",
    description:
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
    imageUrl: "",
    downloadUrl: "",
  ),
  Project(
    name: "E-Classified",
    company: "Ng Solutions",
    description:
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
    imageUrl: "",
    downloadUrl: "",
  ),
];
