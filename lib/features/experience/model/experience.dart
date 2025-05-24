// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Experience {
  final String jobTitle;
  final String companyName;
  final String companyLocation;
  final String companyLogo;
  final String companyWebsite;
  final String startDate;
  final String endDate;

  Experience({
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
    return Experience(
      jobTitle: map['jobTitle'] as String,
      companyName: map['companyName'] as String,
      companyLocation: map['companyLocation'] as String,
      companyLogo: map['companyLogo'] as String,
      companyWebsite: map['companyWebsite'] as String,
      startDate: map['startDate'] as String,
      endDate: map['endDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Experience.fromJson(String source) =>
      Experience.fromMap(json.decode(source) as Map<String, dynamic>);

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
