import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/features/experience/model/experience.dart';

final experienceControllerProvider = Provider<List<Experience>>((ref) {
  return exprienceJson.map((e) => Experience.fromMap(e)).toList();
});
