import 'package:flutter/material.dart';
import 'package:patlytics_client/core/style/app_text_style.dart';

class AppTextButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback? onPressed;

  const AppTextButton({
    super.key,
    required this.title,
    this.loading = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) => IgnorePointer(
        ignoring: loading,
        child: FilledButton(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: AppTextStyles.body,
              ),
              if (loading)
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: _buildLoadingIndicator(),
                ),
            ],
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
