import 'package:patlytics_client/feature/infringement/data/model/infringement_analysis.dart';

abstract class AnalysisRepo {
  Future<InfringementAnalysis> getInfringementAnalysis();
}
