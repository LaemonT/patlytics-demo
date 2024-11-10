part of 'analysis_bloc.dart';

final class AnalysisState extends Equatable {
  const AnalysisState({
    this.patentId = '',
    this.companyName = '',
    this.loading = false,
    this.savedAnalysis = false,
    this.analysis,
    this.errorMessage,
    this.successMessage,
  }) : inputCompleted = patentId.length > 8 && companyName.length > 2;

  final String patentId;
  final String companyName;
  final bool loading;
  final bool savedAnalysis;
  final bool inputCompleted;
  final InfringementAnalysis? analysis;
  final String? errorMessage;
  final String? successMessage;

  @override
  List<Object?> get props => [
        patentId,
        companyName,
        loading,
        savedAnalysis,
        inputCompleted,
        analysis,
        errorMessage,
        successMessage,
      ];

  AnalysisState copyWith({
    String? patentId,
    String? companyName,
    bool? loading,
    bool? savedAnalysis,
    InfringementAnalysis? analysis,
    String? errorMessage,
    String? successMessage,
  }) {
    return AnalysisState(
      patentId: patentId ?? this.patentId,
      companyName: companyName ?? this.companyName,
      loading: loading ?? this.loading,
      savedAnalysis: savedAnalysis ?? this.savedAnalysis,
      analysis: analysis,
      errorMessage: errorMessage ?? this.errorMessage,
      successMessage: successMessage ?? this.successMessage,
    );
  }
}
