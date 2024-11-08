import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:patlytics_client/app/di/injector.dart';
import 'package:patlytics_client/app/routes/app_routes.dart';
import 'package:patlytics_client/feature/infringement/presentation/bloc/analysis_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final patentIdController = TextEditingController(text: 'US-RE49889-E1');
  final companyNameController = TextEditingController(text: 'Walmar');

  @override
  Widget build(BuildContext context) => BlocProvider.value(
      value: AppInjector.instance<AnalysisBloc>(),
      child: BlocListener<AnalysisBloc, AnalysisState>(
        listener: (context, state) {
          switch (state) {
            case AnalysisSucceed():
              context.go(AppRoute.analysis.path, extra: state.analysis);
              break;
            case AnalysisError():
              showAdaptiveDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog.adaptive(
                  content: Text(state.errorMessage),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
              break;
            default:
              break;
          }
        },
        child: Scaffold(
          body: Center(
            child: SizedBox(
              width: 320,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Infringement Analysis',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 24),
                  _buildPatentIdInput(),
                  const SizedBox(height: 16),
                  _buildCompanyNameInput(),
                  const SizedBox(height: 24),
                  BlocBuilder<AnalysisBloc, AnalysisState>(
                    builder: (context, state) => switch (state) {
                      AnalysisInitial() ||
                      AnalysisSucceed() ||
                      AnalysisError() =>
                        _buildSubmitButton(context, false),
                      AnalysisLoading() => _buildSubmitButton(context, true),
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ));

  Widget _buildPatentIdInput() => TextField(
        controller: patentIdController,
        decoration: const InputDecoration(
          labelText: 'Patent ID (Publication Number)',
          hintText: 'Enter patent ID (publication number)',
        ),
      );

  Widget _buildCompanyNameInput() => TextField(
        controller: companyNameController,
        decoration: const InputDecoration(
          labelText: 'Company Name',
          hintText: 'Enter company name',
        ),
      );

  Widget _buildSubmitButton(BuildContext context, bool loading) =>
      IgnorePointer(
        ignoring: loading,
        child: SizedBox(
          width: double.infinity,
          height: 40,
          child: ListenableBuilder(
            listenable: Listenable.merge([
              patentIdController,
              companyNameController,
            ]),
            builder: (context, child) {
              // Patent ID must have more than 8 characters
              // Company name must have more than 2 characters
              final completed = patentIdController.text.length > 8 &&
                  companyNameController.text.length > 2;
              return FilledButton(
                onPressed: completed
                    ? () {
                        context.read<AnalysisBloc>().checkInfringement(
                              patentIdController.text,
                              companyNameController.text,
                            );
                      }
                    : null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(loading ? 'Analysing...' : 'Check for Infringement'),
                    if (loading)
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: _buildLoadingIndicator(),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      );

  Widget _buildLoadingIndicator() => const SizedBox(
        width: 12,
        height: 12,
        child: CircularProgressIndicator(
          color: Colors.white70,
          strokeWidth: 2,
        ),
      );
}
