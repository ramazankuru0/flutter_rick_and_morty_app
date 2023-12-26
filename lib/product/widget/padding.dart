import 'package:flutter/material.dart';

final class ProjectPadding extends EdgeInsets {
  /// horizontal=15 , vertical=10
  const ProjectPadding.symmetric() : super.symmetric(horizontal: 15, vertical: 10);

  /// only horizontal=12
  const ProjectPadding.symmetricHorizontal() : super.symmetric(horizontal: 12);

  /// only bottom=10
  const ProjectPadding.only() : super.only(bottom: 10);
}
