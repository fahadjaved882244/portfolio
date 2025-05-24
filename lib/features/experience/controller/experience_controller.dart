import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/features/experience/model/experience.dart';
import 'package:portfolio/features/experience/repository/local_experience_repository.dart';

final experienceControllerProvider = FutureProvider<List<Experience>>((ref) {
  final repository = ref.watch(localExperienceRepositoryProvider);
  return repository.fetchExperiences();
});
