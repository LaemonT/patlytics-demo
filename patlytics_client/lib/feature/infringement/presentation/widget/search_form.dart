import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patlytics_client/core/style/app_text_style.dart';
import 'package:patlytics_client/core/widget/app_input_field.dart';
import 'package:patlytics_client/core/widget/app_text_button.dart';
import 'package:patlytics_client/feature/infringement/presentation/bloc/analysis_bloc.dart';

class SearchForm extends StatelessWidget {
  final double width;

  const SearchForm({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Patent Infringement Check',
              style: AppTextStyles.headline,
            ),
            const SizedBox(height: 24),
            _buildPatentIdInput(context),
            const SizedBox(height: 16),
            _buildCompanyNameInput(context),
            const SizedBox(height: 24),
            BlocBuilder<AnalysisBloc, AnalysisState>(
              builder: (context, state) => _buildSubmitButton(context, state),
            ),
          ],
        ),
      );

  Widget _buildPatentIdInput(BuildContext context) => AppInputField(
        labelText: 'Patent ID (Publication Number)',
        hintText: 'Enter patent ID (publication number)',
        onChanged: context.read<AnalysisBloc>().patentIdChanged,
      );

  Widget _buildCompanyNameInput(BuildContext context) => AppInputField(
        labelText: 'Company Name',
        hintText: 'Enter company name',
        onChanged: context.read<AnalysisBloc>().companyNameChanged,
      );

  Widget _buildSubmitButton(BuildContext context, AnalysisState state) => SizedBox(
        width: double.infinity,
        height: 40,
        child: AppTextButton(
          title: state.loading ? 'Analysing...' : 'Check for Infringement',
          loading: state.loading,
          onPressed: state.inputCompleted
              ? () {
                  context.read<AnalysisBloc>().checkInfringement();
                }
              : null,
        ),
      );
}
