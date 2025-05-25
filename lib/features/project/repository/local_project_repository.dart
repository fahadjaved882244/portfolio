import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/data/local_db.dart';
import 'package:portfolio/features/project/model/project_model.dart';
import 'package:portfolio/features/project/repository/i_project_repository.dart';

final projectRepositoryProvider = Provider<IProjectRepository>(
  (ref) {
    final localDb = ref.watch(localDbProvider);
    return LocalProjectRepository(localDb);
  },
);

class LocalProjectRepository implements IProjectRepository {
  final LocalDb _localDb;
  LocalProjectRepository(this._localDb);

  @override
  Future<List<Project>> fetchProjects() {
    final jsonprojects = _localDb.getProjects();
    final projectList = jsonprojects.map((e) => Project.fromMap(e)).toList();
    return Future.value(projectList);
  }
}
