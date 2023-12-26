import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/features/character/character_view_model.dart';
import 'package:rick_and_morty/features/episode/episode_view_model.dart';
import 'package:rick_and_morty/features/location/location_view_model.dart';
import 'package:rick_and_morty/features/search/search_view_model.dart';
import 'package:rick_and_morty/product/theme/theme.dart';

import 'core/routes/app_router.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => CharacterViewModel()),
    ChangeNotifierProvider(create: (_) => EpisodeViewModel()),
    ChangeNotifierProvider(create: (_) => SearchViewModel()),
    ChangeNotifierProvider(create: (_) => LocationViewModel())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty',
      theme: ProjectTheme().light,
      routerConfig: _appRouter.config(),
    );
  }
}
