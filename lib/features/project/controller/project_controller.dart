// create a project controller clas using riverpod to manage the project data

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/features/project/model/project_model.dart';

final projectControllerProvider = Provider<List<Project>>((ref) {
  return jsonProjects.map((e) => Project.fromMap(e)).toList();
});
