import 'package:json_annotation/json_annotation.dart';

part 'infringement_analysis.g.dart';

@JsonSerializable()
class InfringementAnalysis {
  final String? analysisId;
  final String? patentId;
  final String? companyName;
  final String? analysisDate;
  final List<TopInfringingProduct>? topInfringingProducts;
  final String? overallRiskAssessment;

  InfringementAnalysis({
    this.analysisId,
    this.patentId,
    this.companyName,
    this.analysisDate,
    this.topInfringingProducts,
    this.overallRiskAssessment,
  });

  factory InfringementAnalysis.fromJson(Map<String, dynamic> json) => _$InfringementAnalysisFromJson(json);

  Map<String, dynamic> toJson() => _$InfringementAnalysisToJson(this);
}

@JsonSerializable()
class TopInfringingProduct {
  final String? productName;
  final String? infringementLikelihood;
  final List<String>? relevantClaims;
  final String? explanation;
  final List<String>? specificFeatures;

  TopInfringingProduct({
    this.productName,
    this.infringementLikelihood,
    this.relevantClaims,
    this.explanation,
    this.specificFeatures,
  });

  factory TopInfringingProduct.fromJson(Map<String, dynamic> json) => _$TopInfringingProductFromJson(json);

  Map<String, dynamic> toJson() => _$TopInfringingProductToJson(this);
}
