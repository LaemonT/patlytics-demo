import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patlytics_client/core/app_logger.dart';
import 'package:patlytics_client/feature/infringement/data/model/infringement_analysis.dart';
import 'package:patlytics_client/feature/infringement/domain/repository/analysis_repo.dart';

part 'analysis_state.dart';

class AnalysisBloc extends Cubit<AnalysisState> {
  final AnalysisRepo _analysisRepo;

  AnalysisBloc(
    this._analysisRepo,
  ) : super(AnalysisInitial());

  Future<void> loadInfringementAnalysis() async {
    try {
      emit(AnalysisLoading());
      final response = await _analysisRepo.getInfringementAnalysis();
      emit(AnalysisSucceed(response));
    } catch (error, stackTree) {
      AppLogger.instance.e('Load infringement analysis failed', e: error, st: stackTree);
      emit(AnalysisError(error.toString()));
    }
  }
}
