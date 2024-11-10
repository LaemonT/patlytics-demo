import 'package:patlytics_client/core/error_handler.dart';
import 'package:patlytics_client/feature/infringement/data/datasource/remote/analysis_api.dart';
import 'package:patlytics_client/feature/infringement/data/model/infringement_analysis.dart';
import 'package:patlytics_client/feature/infringement/domain/repository/analysis_repo.dart';

class AnalysisRepoImp implements AnalysisRepo {
  final AnalysisApi _apiClient;

  AnalysisRepoImp(
    this._apiClient,
  );

  @override
  Future<InfringementAnalysis> fetchInfringementAnalysis(
    String patentId,
    String companyName,
  ) {
    return _apiClient.fetchInfringementsAnalysis(patentId, companyName).catchError(handleError);
  }

  @override
  Future<List<InfringementAnalysis>> fetchSavedAnalyses(
    String userId,
  ) {
    return _apiClient.fetchSavedAnalyses(userId).catchError(handleError);
  }

  @override
  Future<InfringementAnalysis> saveAnalysisResult(
    String userId,
    InfringementAnalysis analysis,
  ) {
    return _apiClient.saveAnalysis(userId, analysis).catchError(handleError);
  }
}
