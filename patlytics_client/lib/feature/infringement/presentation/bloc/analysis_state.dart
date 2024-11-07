part of 'analysis_bloc.dart';

sealed class AnalysisState {}

final class AnalysisInitial extends AnalysisState {}

final class AnalysisLoading extends AnalysisState {}

final class AnalysisSucceed extends AnalysisState {
  final InfringementAnalysis analysis;
  AnalysisSucceed(this.analysis);
}

final class AnalysisError extends AnalysisState {
  late final String errorMessage;
  AnalysisError(this.errorMessage);
}
