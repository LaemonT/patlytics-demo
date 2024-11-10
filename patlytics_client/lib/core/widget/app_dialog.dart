import 'package:flutter/material.dart';

class AppDialog {
  AppDialog._();

  static showSimple(BuildContext context, String content) {
    if (ModalRoute.of(context)?.isCurrent == true) {
      showAdaptiveDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog.adaptive(
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
