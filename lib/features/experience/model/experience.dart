import 'package:flutter/foundation.dart';

@immutable
class Experience {
  final String jobTitle;
  final String companyName;
  final String companyLocation;
  final String companyLogo;
  final String companyWebsite;
  final String startDate;
  final String endDate;

  const Experience({
    required this.jobTitle,
    required this.companyName,
    required this.companyLocation,
    required this.companyLogo,
    required this.companyWebsite,
    required this.startDate,
    required this.endDate,
  });

  Experience copyWith({
    String? jobTitle,
    String? companyName,
    String? companyLocation,
    String? companyLogo,
    String? companyWebsite,
    String? startDate,
    String? endDate,
  }) {
    return Experience(
      jobTitle: jobTitle ?? this.jobTitle,
      companyName: companyName ?? this.companyName,
      companyLocation: companyLocation ?? this.companyLocation,
      companyLogo: companyLogo ?? this.companyLogo,
      companyWebsite: companyWebsite ?? this.companyWebsite,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'jobTitle': jobTitle,
      'companyName': companyName,
      'companyLocation': companyLocation,
      'companyLogo': companyLogo,
      'companyWebsite': companyWebsite,
      'startDate': startDate,
      'endDate': endDate,
    };
  }

  factory Experience.fromMap(Map<String, dynamic> map) {
    if (map.isEmpty) {
      throw ArgumentError('Map cannot be empty');
    }
    if (!map.containsKey('jobTitle') ||
        !map.containsKey('companyName') ||
        !map.containsKey('companyLocation') ||
        !map.containsKey('companyLogo') ||
        !map.containsKey('companyWebsite') ||
        !map.containsKey('startDate') ||
        !map.containsKey('endDate')) {
      throw ArgumentError('Map is missing required keys');
    }

    if (map['jobTitle'] is! String ||
        map['companyName'] is! String ||
        map['companyLocation'] is! String ||
        map['companyLogo'] is! String ||
        map['companyWebsite'] is! String ||
        map['startDate'] is! String ||
        map['endDate'] is! String) {
      throw ArgumentError('Map contains invalid types for required keys');
    }
    return Experience(
      jobTitle: map['jobTitle'],
      companyName: map['companyName'],
      companyLocation: map['companyLocation'],
      companyLogo: map['companyLogo'],
      companyWebsite: map['companyWebsite'],
      startDate: map['startDate'],
      endDate: map['endDate'],
    );
  }

  @override
  String toString() {
    return 'Experience(jobTitle: $jobTitle, companyName: $companyName, companyLocation: $companyLocation, companyLogo: $companyLogo, companyWebsite: $companyWebsite, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(covariant Experience other) {
    if (identical(this, other)) return true;

    return other.jobTitle == jobTitle &&
        other.companyName == companyName &&
        other.companyLocation == companyLocation &&
        other.companyLogo == companyLogo &&
        other.companyWebsite == companyWebsite &&
        other.startDate == startDate &&
        other.endDate == endDate;
  }

  @override
  int get hashCode {
    return jobTitle.hashCode ^
        companyName.hashCode ^
        companyLocation.hashCode ^
        companyLogo.hashCode ^
        companyWebsite.hashCode ^
        startDate.hashCode ^
        endDate.hashCode;
  }
}
