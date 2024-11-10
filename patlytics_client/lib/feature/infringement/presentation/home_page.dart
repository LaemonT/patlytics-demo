import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:patlytics_client/app/di/injector.dart';
import 'package:patlytics_client/app/routes/app_routes.dart';
import 'package:patlytics_client/core/style/app_text_style.dart';
import 'package:patlytics_client/core/widget/app_dialog.dart';
import 'package:patlytics_client/feature/infringement/data/model/infringement_analysis.dart';
import 'package:patlytics_client/feature/infringement/presentation/bloc/analysis_bloc.dart';
import 'package:patlytics_client/feature/infringement/presentation/bloc/saved_analyses_bloc.dart';
import 'package:patlytics_client/feature/infringement/presentation/widget/search_form.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AppInjector.instance<AnalysisBloc>(),
          ),
          BlocProvider(
            create: (_) => AppInjector.instance<SavedAnalysesBloc>(),
          ),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<AnalysisBloc, AnalysisState>(
              listener: (context, state) {
                if (state.analysis != null) {
                  context.go(AppRoute.home.analysis.path);
                } else if (state.errorMessage != null) {
                  AppDialog.showSimple(context, state.errorMessage!);
                }
              },
            ),
            BlocListener<SavedAnalysesBloc, SavedAnalysesState>(
              listener: (context, state) {
                if (state.analyses != null) {
                  showAdaptiveDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (_) => _buildSavedAnalysisDialog(context, state.analyses!),
                  );
                } else if (state.errorMessage != null) {
                  AppDialog.showSimple(context, state.errorMessage!);
                }
              },
            ),
          ],
          child: Scaffold(
            body: const Center(
              child: SearchForm(width: 320),
            ),
            floatingActionButton: BlocBuilder<SavedAnalysesBloc, SavedAnalysesState>(
              builder: (context, state) => FloatingActionButton(
                child: const Icon(Icons.manage_search),
                onPressed: () {
                  context.read<SavedAnalysesBloc>().getSavedAnalyses();
                },
              ),
            ),
          ),
        ),
      );

  Widget _buildSavedAnalysisDialog(
    BuildContext context,
    List<InfringementAnalysis> analyses,
  ) =>
      SimpleDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        titlePadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        title: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.1),
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(8),
            ),
          ),
          child: Text('Saved Analyses', style: AppTextStyles.subtitle),
        ),
        children: analyses
            .map(
              (analysis) => ListTile(
                title: Text('${analysis.companyName} (${analysis.analysisDate})'),
                subtitle: Text('${analysis.patentId} (${analysis.analysisId})'),
                onTap: () {
                  context.read<AnalysisBloc>().setAnalysis(analysis);
                  context.pop();
                  context.go(AppRoute.home.analysis.path);
                },
              ),
            )
            .toList(),
      );
}
