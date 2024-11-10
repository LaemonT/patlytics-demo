import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patlytics_client/core/app_logger.dart';
import 'package:patlytics_client/feature/infringement/data/model/infringement_analysis.dart';
import 'package:patlytics_client/feature/infringement/domain/repository/analysis_repo.dart';

part 'saved_analyses_state.dart';

class SavedAnalysesBloc extends Cubit<SavedAnalysesState> {
  final AnalysisRepo _analysisRepo;

  SavedAnalysesBloc(
    this._analysisRepo,
  ) : super(const SavedAnalysesState());

  Future<void> getSavedAnalyses() async {
    try {
      final response = await _analysisRepo.fetchSavedAnalyses(state.userId);
      if (response.isNotEmpty) {
        emit(
          state.copyWith(analyses: response),
        );
      } else {
        emit(
          state.copyWith(errorMessage: 'Nothing is saved here.'),
        );
      }
    } catch (error, _) {
      AppLogger.instance.d('Load saved analyses failed');
      emit(
        state.copyWith(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
