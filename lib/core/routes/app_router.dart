import 'package:auto_route/auto_route.dart';
import 'package:rick_and_morty/core/routes/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(
          page: HomeRoute.page,
          children: [
            AutoRoute(page: CharacterRoute.page, initial: true),
            AutoRoute(page: EpisodeRoute.page),
            AutoRoute(page: LocationRoute.page),
            AutoRoute(page: SearchRoute.page),
          ],
        ),
        CustomRoute(page: CharacterDetailRoute.page, transitionsBuilder: TransitionsBuilders.fadeIn),
        CustomRoute(page: EpisodeDetailRoute.page, transitionsBuilder: TransitionsBuilders.fadeIn),
        CustomRoute(page: LocationDetailRoute.page, transitionsBuilder: TransitionsBuilders.fadeIn),
      ];
}
