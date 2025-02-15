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

final jsonProjects = [
  {
    "name": "Shared Smiles",
    "company": "Exacology",
    "description":
        "Spreading Joy, One Smile at a Time. A Platform to Connect, Heal, and Grow. Its a place where you are never alone on your journey. As we know that life's ups and downs can be challenging, but it's easier when you have a supportive community by your side. The app provides a safe, welcoming space where you can connect with people who truly get it.",
    "imageUrl": "assets/shared_smiles/thumbnail.webp",
    "coverUrl": "assets/shared_smiles/cover.jpg",
    "downloadUrl": "https://exakty-web-shared-smiles.vercel.app/",
    "contributions": [],
    "challenges": [],
    "tools": [
      "Flutter",
      "Riverpod",
      "Hive",
      "Flutter Web",
      "Figma",
      "REST API",
      "Postman",
      "Stripe",
      "In App Purchase",
      "Deep Linking",
      "Scrum",
    ]
  },
  {
    "name": "Food Delivery",
    "company": "Ng Solutions",
    "description":
        "Halal Finder is a mobile application designed to help Muslim residents in the UK easily search for and order halal food and meat from nearby vendors. The app also integrates an online marketplace for religious products, making it a one-stop solution for halal needs. Additionally, it features a barcode scanning tool that allows users to scan product labels and instantly determine whether an item is halal or not. The platform consists of: A CRM system to manage customer interactions and orders efficiently. An admin panel for vendors to oversee listings, orders, and inventory. Mobile apps for both consumers and suppliers, ensuring a seamless ordering and fulfillment experience.",
    "imageUrl": "assets/halal_finder/thumbnail.png",
    "coverUrl": "assets/halal_finder/cover.png",
    "downloadUrl": "",
    "contributions": [],
    "challenges": [],
    "tools": [
      "Flutter",
      "Firebase",
      "Google Cloud Functions",
      "Google Maps",
      "Stripe",
      "GetX",
      "Cart",
      "Checkout",
      "Figma",
      "Push Notifications",
      "React JS",
      "Admin Panel",
      "CRM",
      "Kanban",
      "Play Store",
      "App Store"
    ]
  },
  {
    "name": "Colartive",
    "company": "Personal Project",
    "description":
        "It was a first-of-its-kind digital art generator mobile application built using Flutter. The app offers a combination of Colors, Art, and Creativity in a very easy and simple way to generate thousands of unique AMOLED, Minimalistic, Abstract, Vector, and Aesthetic art in 4K Quality.",
    "imageUrl": "assets/colartive/thumbnail.png",
    "coverUrl": "assets/colartive/cover.png",
    "downloadUrl": "",
    "contributions": [],
    "challenges": [],
    "tools": [
      "Flutter",
      "Firebase",
      "SQLite",
      "BLoC",
      "Flutter Canvas Kit",
      "In App Purchase",
      "Coral Draw",
      "Google Play Store",
    ]
  },
  {
    "name": "Lead Manager",
    "company": "Personal Project",
    "description":
        "Lead Manager is a hybrid web application built using Flutter Web and Firebase, designed to efficiently manage your leads. It allows businesses to track all leads and deals generated by their products while maintaining a detailed history of product interactions. Multiple agents and managers can collaborate in real time, updating and monitoring leads seamlessly. With Firebase as the backend, the app ensures secure data storage, real-time updates, and smooth scalability.",
    "imageUrl": "assets/lead_manager/thumbnail.webp",
    "coverUrl": "assets/lead_manager/cover.png",
    "downloadUrl": "https://smart-business-managemen-40121.web.app/#/login",
    "contributions": [],
    "challenges": [],
    "tools": [
      "Flutter Web",
      "Firebase",
      "BLoC",
      "Responsive Design",
      "REST API",
      "JSON",
      "Push Notifications"
    ]
  },
  {
    "name": "Psychometrica",
    "company": "Exacology",
    "description":
        "Psychometrica is the official mind & self-discovery application of the scientific non-profit mental health organization. Improve your mental health & try self-improvement using Psychometrica! Explore your Mind with all science-based tests like IQ, EQ, Love Style and Personality tests.",
    "imageUrl": "assets/psychometrica/thumbnail.webp",
    "coverUrl": "assets/psychometrica/cover.jpg",
    "downloadUrl": "https://psychometrica.org/",
    "contributions": [],
    "challenges": [],
    "tools": [
      "Flutter",
      "Provider",
      "Hive",
      "GraphQL",
      "Web Sockets",
      "Push Notifications",
      "Deep Linking",
      "Cache Management",
      "Stripe",
    ]
  },
  {
    "name": "E-Classified",
    "company": "Ng Solutions",
    "description":
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
    "imageUrl": "assets/e_classified/thumbnail.png",
    "coverUrl": "assets/e_classified/cover.png",
    "downloadUrl": "",
    "contributions": [],
    "challenges": [],
    "tools": [
      "Flutter",
      "MS SQL Server",
      "REST API",
      "Postman",
      "BLoC",
      "Social Media Integration",
      "Push Notifications",
    ]
  }
];
