// create a project controller clas using riverpod to manage the project data

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/features/project/model/project_model.dart';
import 'package:portfolio/features/project/repository/mock_project_repository.dart';

final projectControllerProvider = FutureProvider<List<Project>>((ref) {
  final repository = ref.watch(projectRepositoryProvider);
  return repository.fetchProjects();
});
