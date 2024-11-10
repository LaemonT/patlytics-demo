import 'package:patlytics_client/feature/infringement/data/model/infringement_analysis.dart';

abstract class AnalysisRepo {
  Future<InfringementAnalysis> fetchInfringementAnalysis(
    String patentId,
    String companyName,
  );

  Future<List<InfringementAnalysis>> fetchSavedAnalyses(
    String userId,
  );

  Future<InfringementAnalysis> saveAnalysisResult(
    String userId,
    InfringementAnalysis analysis,
  );
}
