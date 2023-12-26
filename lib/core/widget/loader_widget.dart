import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

final class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset('assets/lottie/loader.json', width: 35, height: 35);
  }
}
