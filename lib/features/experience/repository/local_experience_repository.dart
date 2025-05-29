import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/features/experience/model/experience.dart';
import 'package:portfolio/features/experience/repository/i_experience_repository.dart';

final localExperienceRepositoryProvider = Provider<LocalExperienceRepository>(
  (ref) => LocalExperienceRepository(),
);

class LocalExperienceRepository implements IExperienceRepository {
  @override
  Future<List<Experience>> fetchExperiences() {
    final exprienceJson = [
      {
        'jobTitle': 'Lead Mobile Application Developer',
        'companyName': 'Exacology',
        'companyLocation': 'Delawre, USA',
        'companyLogo': 'assets/exacology_logo.jpeg',
        'companyWebsite': 'https://www.linkedin.com/company/exacology/',
        'startDate': 'Mar 2023',
        'endDate': 'Present',
      },
      {
        'jobTitle': 'Flutter Developer',
        'companyName': 'Next Generation Technology Solutions',
        'companyLocation': 'Bridgewater, UK',
        'companyLogo': 'assets/ng_tech_logo.jpeg',
        'companyWebsite':
            'https://www.linkedin.com/company/next-generation-technology-solutions/',
        'startDate': 'Jan 2021',
        'endDate': 'Feb 2023',
      },
      {
        'jobTitle': 'C++ Developer',
        'companyName': 'FreeLancer',
        'companyLocation': 'Remote',
        'companyLogo': 'assets/freelancer_logo.webp',
        'companyWebsite': 'https://sasystems.solutions/',
        'startDate': 'Aug 2019',
        'endDate': 'Dec 2020',
      },
    ];
    return Future.value(
      exprienceJson.map((e) => Experience.fromMap(e)).toList(),
    );
  }
}
