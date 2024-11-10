part of 'saved_analyses_bloc.dart';

final class SavedAnalysesState extends Equatable {
  const SavedAnalysesState({
    this.userId = '',
    this.analyses,
    this.errorMessage,
  });

  final String userId;
  final List<InfringementAnalysis>? analyses;
  final String? errorMessage;

  @override
  List<Object?> get props => [userId, analyses, errorMessage];

  SavedAnalysesState copyWith({
    String? userId,
    List<InfringementAnalysis>? analyses,
    String? errorMessage,
  }) {
    return SavedAnalysesState(
      userId: userId ?? this.userId,
      analyses: analyses ?? this.analyses,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
