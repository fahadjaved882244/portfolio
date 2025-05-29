import 'package:portfolio/features/project/model/project_model.dart';
import 'package:portfolio/features/project/repository/i_project_repository.dart';

class MockProjectRepository implements IProjectRepository {
  Future<List<Project>> Function()? fetchProjectsCallback;

  @override
  Future<List<Project>> fetchProjects() {
    if (fetchProjectsCallback != null) {
      return fetchProjectsCallback!();
    }
    throw UnimplementedError('fetchProjectsCallback is not set');
  }
}
