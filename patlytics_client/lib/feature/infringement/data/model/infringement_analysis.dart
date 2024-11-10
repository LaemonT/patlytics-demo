import 'package:json_annotation/json_annotation.dart';

part 'infringement_analysis.g.dart';

@JsonSerializable()
class InfringementAnalysis {
  @JsonKey(name: 'analysis_id')
  final String analysisId;
  @JsonKey(name: 'patent_id')
  final String patentId;
  @JsonKey(name: 'company_name')
  final String companyName;
  @JsonKey(name: 'analysis_date')
  final String analysisDate;
  @JsonKey(name: 'top_infringing_products')
  final List<TopInfringingProduct> topInfringingProducts;
  @JsonKey(name: 'overall_risk_assessment')
  final String overallRiskAssessment;

  InfringementAnalysis({
    required this.analysisId,
    required this.patentId,
    required this.companyName,
    required this.analysisDate,
    required this.topInfringingProducts,
    required this.overallRiskAssessment,
  });

  factory InfringementAnalysis.fromJson(Map<String, dynamic> json) => _$InfringementAnalysisFromJson(json);

  Map<String, dynamic> toJson() => _$InfringementAnalysisToJson(this);
}

@JsonSerializable()
class TopInfringingProduct {
  @JsonKey(name: 'product_name')
  final String productName;
  @JsonKey(name: 'infringement_likelihood')
  final String infringementLikelihood;
  @JsonKey(name: 'relevant_claims')
  final List<String> relevantClaims;
  @JsonKey(name: 'explanation')
  final String explanation;
  @JsonKey(name: 'specific_features')
  final List<String> specificFeatures;

  TopInfringingProduct({
    required this.productName,
    required this.infringementLikelihood,
    required this.relevantClaims,
    required this.explanation,
    required this.specificFeatures,
  });

  factory TopInfringingProduct.fromJson(Map<String, dynamic> json) => _$TopInfringingProductFromJson(json);

  Map<String, dynamic> toJson() => _$TopInfringingProductToJson(this);
}
