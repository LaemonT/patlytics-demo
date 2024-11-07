import 'package:get_it/get_it.dart';
import 'package:patlytics_client/feature/infringement/data/repository/analysis_repo_imp.dart';
import 'package:patlytics_client/feature/infringement/domain/repository/analysis_repo.dart';

class RepositoryModule {
  RepositoryModule._();

  static void init(GetIt injector) {
    injector.registerLazySingleton<AnalysisRepo>(
      () => AnalysisRepoImp(
        injector(),
      ),
    );
  }
}
