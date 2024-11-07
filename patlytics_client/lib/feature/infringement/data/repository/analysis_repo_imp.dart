import 'package:patlytics_client/feature/infringement/data/datasource/remote/analysis_api.dart';
import 'package:patlytics_client/feature/infringement/data/model/infringement_analysis.dart';
import 'package:patlytics_client/feature/infringement/domain/repository/analysis_repo.dart';

class AnalysisRepoImp implements AnalysisRepo {
  final AnalysisApi _apiClient;

  AnalysisRepoImp(
    this._apiClient,
  );

  @override
  Future<InfringementAnalysis> getInfringementAnalysis() {
    return _apiClient.getInfringementsAnalysis();
  }
}
