// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:rick_and_morty/core/routes/app_router.gr.dart';
import 'package:rick_and_morty/product/constants/color_constants.dart';

import '../../product/enums/size_ratio.dart';

@RoutePage()
final class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      extendBody: true,
      appBarBuilder: (context, tabsRouter) {
        return AppBar(
          title: Image.asset(
            'assets/image/logo.png',
            height: MediaQuery.of(context).size.height * SizeRatio.normalRatio.value,
          ),
          centerTitle: true,
        );
      },
      routes: const [CharacterRoute(), EpisodeRoute(), LocationRoute(), SearchRoute()],
      bottomNavigationBuilder: (context, tabsRouter) => _BottomNavigationBar(tabsRouter: tabsRouter),
    );
  }
}

final class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({
    Key? key,
    required this.tabsRouter,
  }) : super(key: key);

  final TabsRouter tabsRouter;
  static const double iconSize = 21;

  @override
  Widget build(BuildContext context) {
    return DotNavigationBar(
        marginR: EdgeInsets.zero,
        onTap: tabsRouter.setActiveIndex,
        selectedItemColor: ColorConstants.blue,
        currentIndex: tabsRouter.activeIndex,
        items: [
          DotNavigationBarItem(icon: const Icon(Icons.home_outlined, size: iconSize)),
          DotNavigationBarItem(icon: const Icon(Icons.tv_outlined, size: iconSize)),
          DotNavigationBarItem(icon: const Icon(Icons.location_on_outlined, size: iconSize)),
          DotNavigationBarItem(icon: const Icon(Icons.search_outlined, size: iconSize))
        ]);
  }
}
