import 'package:portfolio/data/local_db.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockLocalDb extends LocalDb {
  MockLocalDb() : super(MockSharedPreferences());

  List<Map<String, dynamic>> Function()? getProjectsCallback;

  @override
  List<Map<String, dynamic>> getProjects() {
    if (getProjectsCallback != null) {
      return getProjectsCallback!();
    }
    return [
      {
        'name': 'Mock Project',
        'company': 'Mock Company',
        'description': 'This is a mock project description.',
        'imageUrl': 'https://example.com/mock_image.png',
        'coverUrl': 'https://example.com/mock_cover.png',
        'downloadUrl': 'https://example.com/mock_download.zip',
        'contributions': ['Mock Contribution 1', 'Mock Contribution 2'],
        'challenges': ['Mock Challenge 1', 'Mock Challenge 2'],
        'tools': ['Tool 1', 'Tool 2'],
      }
    ];
  }
}

class MockSharedPreferences implements SharedPreferences {
  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
