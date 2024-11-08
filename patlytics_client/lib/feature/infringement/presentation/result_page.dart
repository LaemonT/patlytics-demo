import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patlytics_client/app/di/injector.dart';
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
            child: BlocBuilder<AnalysisBloc, AnalysisState>(
              builder: (context, state) {
                return switch (state) {
                  AnalysisSucceed() => _buildAnalysis(state.analysis),
                  _ => Container(),
                };
              },
            ),
          ),
        ),
      );

  Widget _buildAnalysis(InfringementAnalysis analysis) => Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.green.shade50,
            // border: RoundedRectangleBorder(borderRadius: BorderRadius.only())
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Patent ID:'),
                      Text('Company Name:'),
                      Text('Overall Risk Assessment:'),
                      Text('Analysis Date:'),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(analysis.patentId),
                      Text(analysis.companyName),
                      Text(analysis.overallRiskAssessment),
                      Text(analysis.analysisDate),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
