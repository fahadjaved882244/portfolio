import 'package:portfolio/features/project/model/project_model.dart';

abstract class IProjectRepository {
  Future<List<Project>> fetchProjects();
}
