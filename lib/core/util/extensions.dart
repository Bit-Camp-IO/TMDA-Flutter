import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as localization;
import 'package:tmda/generated/l10n.dart';

extension BuildContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  double get screenWidth => MediaQuery.sizeOf(this).width;

  double get screenHeight => MediaQuery.sizeOf(this).height;

  S get tr => S.of(this);

  bool get isEnglishLanguage => localization.Intl.getCurrentLocale() == 'en';

  bool get hasFocus => FocusScope.of(this).hasPrimaryFocus;

  bool get isKeyboardClosed => MediaQuery.of(this).viewInsets.bottom <= 0;

  bool get isDarkTheme => Theme.of(this).brightness == Brightness.dark;
}
