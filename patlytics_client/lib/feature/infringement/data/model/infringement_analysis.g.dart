// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'infringement_analysis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfringementAnalysis _$InfringementAnalysisFromJson(
        Map<String, dynamic> json) =>
    InfringementAnalysis(
      analysisId: json['analysisId'] as String?,
      patentId: json['patentId'] as String?,
      companyName: json['companyName'] as String?,
      analysisDate: json['analysisDate'] as String?,
      topInfringingProducts: (json['topInfringingProducts'] as List<dynamic>?)
          ?.map((e) => TopInfringingProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      overallRiskAssessment: json['overallRiskAssessment'] as String?,
    );

Map<String, dynamic> _$InfringementAnalysisToJson(
        InfringementAnalysis instance) =>
    <String, dynamic>{
      'analysisId': instance.analysisId,
      'patentId': instance.patentId,
      'companyName': instance.companyName,
      'analysisDate': instance.analysisDate,
      'topInfringingProducts': instance.topInfringingProducts,
      'overallRiskAssessment': instance.overallRiskAssessment,
    };

TopInfringingProduct _$TopInfringingProductFromJson(
        Map<String, dynamic> json) =>
    TopInfringingProduct(
      productName: json['productName'] as String?,
      infringementLikelihood: json['infringementLikelihood'] as String?,
      relevantClaims: (json['relevantClaims'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      explanation: json['explanation'] as String?,
      specificFeatures: (json['specificFeatures'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$TopInfringingProductToJson(
        TopInfringingProduct instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'infringementLikelihood': instance.infringementLikelihood,
      'relevantClaims': instance.relevantClaims,
      'explanation': instance.explanation,
      'specificFeatures': instance.specificFeatures,
    };
