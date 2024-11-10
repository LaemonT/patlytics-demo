import 'package:flutter/material.dart';

class AppInputField extends StatelessWidget {
  final String? labelText, hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const AppInputField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) => TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
        ),
        onChanged: onChanged,
      );
}
