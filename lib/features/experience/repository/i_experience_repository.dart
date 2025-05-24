import 'package:portfolio/features/experience/model/experience.dart';

abstract class IExperienceRepository {
  Future<List<Experience>> fetchExperiences();
}
