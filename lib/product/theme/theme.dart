import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

final class ProjectTheme {
  ThemeData light = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: ColorConstants.yellow),
      useMaterial3: true,
      cardTheme: const CardTheme(color: ColorConstants.yellow));
}
