import 'package:flutter/material.dart';

class AppFontWeights {
  AppFontWeights._();
  static const bold = FontWeight.w500;
  static const regular = FontWeight.w400;
}

class AppTextStyles {
  AppTextStyles._();

  static const _bold = TextStyle(
    fontWeight: AppFontWeights.bold,
  );

  static const _regular = TextStyle(
    fontWeight: AppFontWeights.regular,
  );

  static final headline = _bold.copyWith(
    fontSize: 20,
  );

  static final title = _bold.copyWith(
    fontSize: 15,
  );

  static final subtitle = _bold.copyWith(
    fontSize: 14,
  );

  static final body = _regular.copyWith(
    fontSize: 14,
  );
}
