// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'infringement_analysis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfringementAnalysis _$InfringementAnalysisFromJson(
        Map<String, dynamic> json) =>
    InfringementAnalysis(
      analysisId: json['analysis_id'] as String,
      patentId: json['patent_id'] as String,
      companyName: json['company_name'] as String,
      analysisDate: json['analysis_date'] as String,
      topInfringingProducts: (json['top_infringing_products'] as List<dynamic>)
          .map((e) => TopInfringingProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      overallRiskAssessment: json['overall_risk_assessment'] as String,
    );

Map<String, dynamic> _$InfringementAnalysisToJson(
        InfringementAnalysis instance) =>
    <String, dynamic>{
      'analysis_id': instance.analysisId,
      'patent_id': instance.patentId,
      'company_name': instance.companyName,
      'analysis_date': instance.analysisDate,
      'top_infringing_products': instance.topInfringingProducts,
      'overall_risk_assessment': instance.overallRiskAssessment,
    };

TopInfringingProduct _$TopInfringingProductFromJson(
        Map<String, dynamic> json) =>
    TopInfringingProduct(
      productName: json['product_name'] as String,
      infringementLikelihood: json['infringement_likelihood'] as String,
      relevantClaims: (json['relevant_claims'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      explanation: json['explanation'] as String,
      specificFeatures: (json['specific_features'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$TopInfringingProductToJson(
        TopInfringingProduct instance) =>
    <String, dynamic>{
      'product_name': instance.productName,
      'infringement_likelihood': instance.infringementLikelihood,
      'relevant_claims': instance.relevantClaims,
      'explanation': instance.explanation,
      'specific_features': instance.specificFeatures,
    };
