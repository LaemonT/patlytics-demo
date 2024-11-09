import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:patlytics_client/app/di/injector.dart';
import 'package:patlytics_client/core/style/app_text_style.dart';
import 'package:patlytics_client/core/widget/app_text_button.dart';
import 'package:patlytics_client/feature/infringement/data/model/infringement_analysis.dart';
import 'package:patlytics_client/feature/infringement/presentation/bloc/analysis_bloc.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({
    super.key,
  });

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: AppInjector.instance<AnalysisBloc>(),
        child: Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 120),
                  child: AppTextButton(
                    title: 'Back',
                    onPressed: () {
                      context.pop();
                    },
                  ),
                ),
                const SizedBox(height: 16),
                BlocBuilder<AnalysisBloc, AnalysisState>(
                  builder: (context, state) {
                    return switch (state) {
                      AnalysisSucceed() => state.analysis.topInfringingProducts.isEmpty
                          ? _buildEmptyResult()
                          : _buildAnalysis(state.analysis),
                      _ => Container(),
                    };
                  },
                ),
              ],
            ),
          ),
        ),
      );

  Widget _buildEmptyResult() => Center(
        child: Text('No infringement found', style: AppTextStyles.title),
      );

  Widget _buildAnalysis(InfringementAnalysis analysis) => Center(
        child: Container(
          constraints: const BoxConstraints(
            minWidth: 300,
            maxWidth: 1000,
          ),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.green.shade50,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfringedInfo(analysis),
              const SizedBox(height: 16),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: analysis.topInfringingProducts.length,
                itemBuilder: (BuildContext context, int index) => _buildInfringedProduct(
                  analysis.topInfringingProducts[index],
                ),
                separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 16),
              ),
              const SizedBox(height: 16),
              Text('Overall Risk Assessment:', style: AppTextStyles.subtitle),
              Text(analysis.overallRiskAssessment, style: AppTextStyles.body),
            ],
          ),
        ),
      );

  Widget _buildInfringedInfo(InfringementAnalysis analysis) => Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Patent ID:', style: AppTextStyles.subtitle),
              Text('Company Name:', style: AppTextStyles.subtitle),
              Text('Analysis Date:', style: AppTextStyles.subtitle),
            ],
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(analysis.patentId, style: AppTextStyles.body),
              Text(analysis.companyName, style: AppTextStyles.body),
              Text(analysis.analysisDate, style: AppTextStyles.body),
            ],
          ),
        ],
      );

  Widget _buildInfringedProduct(TopInfringingProduct product) => Container(
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                children: [
                  _buildItemRow('Product:', product.productName),
                  _buildItemRow('Likelihood:', product.infringementLikelihood),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildExplanation('Explanation', product.explanation),
                  const SizedBox(height: 8),
                  Text(
                    'Infringed Features:',
                    style: AppTextStyles.subtitle,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: product.specificFeatures
                        .map(
                          (feature) => Text(feature, style: AppTextStyles.body),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildExplanation(String title, String body) => RichText(
        text: TextSpan(
          style: TextStyle(color: Colors.black.withOpacity(0.8)),
          children: [
            TextSpan(
              text: '$title: ',
              style: AppTextStyles.subtitle,
            ),
            TextSpan(
              text: body,
              style: AppTextStyles.body,
            ),
          ],
        ),
      );

  Widget _buildItemRow(String title, String body) => Row(
        children: [
          Text(title, style: AppTextStyles.subtitle),
          const SizedBox(width: 8),
          Text(body, style: AppTextStyles.body),
        ],
      );
}
