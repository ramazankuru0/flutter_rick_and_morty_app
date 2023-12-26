import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/routes/app_router.gr.dart';

@RoutePage()
final class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

final class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    removeSplash();
  }

  Future<void> removeSplash() async {
    var routeContext = AutoRouter.of(context);
    await Future.delayed(const Duration(seconds: 3));
    routeContext.replace(const HomeRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/image/splash.jpg',
      fit: BoxFit.cover,
    );
  }
}
