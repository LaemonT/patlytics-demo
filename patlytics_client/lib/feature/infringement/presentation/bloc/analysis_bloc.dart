import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patlytics_client/core/app_logger.dart';
import 'package:patlytics_client/core/service/app_service.dart';
import 'package:patlytics_client/feature/infringement/data/model/infringement_analysis.dart';
import 'package:patlytics_client/feature/infringement/domain/repository/analysis_repo.dart';

part 'analysis_state.dart';

class AnalysisBloc extends Cubit<AnalysisState> {
  final AppService _appService;
  final AnalysisRepo _analysisRepo;

  AnalysisBloc(
    this._appService,
    this._analysisRepo,
  ) : super(const AnalysisState());

  void patentIdChanged(String value) {
    emit(
      state.copyWith(
        patentId: value,
        analysis: null,
        savedAnalysis: false,
      ),
    );
  }

  void companyNameChanged(String value) {
    emit(
      state.copyWith(
        companyName: value,
        analysis: null,
        savedAnalysis: false,
      ),
    );
  }

  Future<void> checkInfringement() async {
    try {
      emit(
        state.copyWith(loading: true),
      );
      final response = await _analysisRepo.fetchInfringementAnalysis(
        state.patentId,
        state.companyName,
      );
      emit(
        state.copyWith(
          loading: false,
          savedAnalysis: false,
          analysis: response,
        ),
      );
    } catch (error, _) {
      AppLogger.instance.d('Load infringement analysis failed');
      emit(
        state.copyWith(
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> saveAnalysisResult(InfringementAnalysis analysis) async {
    try {
      emit(
        state.copyWith(
          loading: true,
          analysis: analysis,
        ),
      );
      final response = await _analysisRepo.saveAnalysisResult(_appService.sessionId!, analysis);
      emit(
        state.copyWith(
          loading: false,
          savedAnalysis: true,
          analysis: response,
          successMessage: 'Analysis result is saved!',
        ),
      );
    } catch (error, _) {
      AppLogger.instance.d('Save analysis failed');
      emit(
        state.copyWith(
          errorMessage: error.toString(),
        ),
      );
    }
  }

  void setAnalysis(InfringementAnalysis analysis) {
    emit(
      state.copyWith(
        analysis: analysis,
        savedAnalysis: true,
      ),
    );
  }
}
