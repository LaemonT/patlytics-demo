import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../model/infringement_analysis.dart';

part 'analysis_api.g.dart';

@RestApi()
abstract class AnalysisApi {
  factory AnalysisApi.create(Dio dio) = _AnalysisApi;

  @GET('/infringement')
  Future<InfringementAnalysis> fetchInfringementsAnalysis(
    @Query('patentId') String patentId,
    @Query('companyName') String companyName,
  );

  @GET('/analyses')
  Future<List<InfringementAnalysis>> fetchSavedAnalyses(
    @Query('userId') String userId,
  );

  @PUT('/analyses')
  Future<InfringementAnalysis> saveAnalysis(
    @Query('userId') String userId,
    @Body() InfringementAnalysis analysis,
  );
}
