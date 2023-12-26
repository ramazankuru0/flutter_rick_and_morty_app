// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;
import 'package:rick_and_morty/features/character/character_view.dart' as _i2;
import 'package:rick_and_morty/features/character_detail/character_detail_view.dart'
    as _i1;
import 'package:rick_and_morty/features/episode/episode_view.dart' as _i4;
import 'package:rick_and_morty/features/episode_detail/episode_detail_view.dart'
    as _i3;
import 'package:rick_and_morty/features/home/home_view.dart' as _i5;
import 'package:rick_and_morty/features/location/location_view.dart' as _i7;
import 'package:rick_and_morty/features/location_detail/location_detail_view.dart'
    as _i6;
import 'package:rick_and_morty/features/search/search_view.dart' as _i8;
import 'package:rick_and_morty/features/splash/splash_view.dart' as _i9;
import 'package:rick_and_morty/product/model/character.dart' as _i12;
import 'package:rick_and_morty/product/model/episode.dart' as _i13;
import 'package:rick_and_morty/product/model/location.dart' as _i14;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    CharacterDetailRoute.name: (routeData) {
      final args = routeData.argsAs<CharacterDetailRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.CharacterDetailView(
          key: args.key,
          character: args.character,
        ),
      );
    },
    CharacterRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CharacterView(),
      );
    },
    EpisodeDetailRoute.name: (routeData) {
      final args = routeData.argsAs<EpisodeDetailRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.EpisodeDetailView(
          key: args.key,
          episode: args.episode,
        ),
      );
    },
    EpisodeRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.EpisodeView(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomeView(),
      );
    },
    LocationDetailRoute.name: (routeData) {
      final args = routeData.argsAs<LocationDetailRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.LocationDetailView(
          key: args.key,
          location: args.location,
        ),
      );
    },
    LocationRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.LocationView(),
      );
    },
    SearchRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SearchView(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SplashView(),
      );
    },
  };
}

/// generated route for
/// [_i1.CharacterDetailView]
class CharacterDetailRoute
    extends _i10.PageRouteInfo<CharacterDetailRouteArgs> {
  CharacterDetailRoute({
    _i11.Key? key,
    required _i12.Character? character,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          CharacterDetailRoute.name,
          args: CharacterDetailRouteArgs(
            key: key,
            character: character,
          ),
          initialChildren: children,
        );

  static const String name = 'CharacterDetailRoute';

  static const _i10.PageInfo<CharacterDetailRouteArgs> page =
      _i10.PageInfo<CharacterDetailRouteArgs>(name);
}

class CharacterDetailRouteArgs {
  const CharacterDetailRouteArgs({
    this.key,
    required this.character,
  });

  final _i11.Key? key;

  final _i12.Character? character;

  @override
  String toString() {
    return 'CharacterDetailRouteArgs{key: $key, character: $character}';
  }
}

/// generated route for
/// [_i2.CharacterView]
class CharacterRoute extends _i10.PageRouteInfo<void> {
  const CharacterRoute({List<_i10.PageRouteInfo>? children})
      : super(
          CharacterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CharacterRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.EpisodeDetailView]
class EpisodeDetailRoute extends _i10.PageRouteInfo<EpisodeDetailRouteArgs> {
  EpisodeDetailRoute({
    _i11.Key? key,
    required _i13.Episode? episode,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          EpisodeDetailRoute.name,
          args: EpisodeDetailRouteArgs(
            key: key,
            episode: episode,
          ),
          initialChildren: children,
        );

  static const String name = 'EpisodeDetailRoute';

  static const _i10.PageInfo<EpisodeDetailRouteArgs> page =
      _i10.PageInfo<EpisodeDetailRouteArgs>(name);
}

class EpisodeDetailRouteArgs {
  const EpisodeDetailRouteArgs({
    this.key,
    required this.episode,
  });

  final _i11.Key? key;

  final _i13.Episode? episode;

  @override
  String toString() {
    return 'EpisodeDetailRouteArgs{key: $key, episode: $episode}';
  }
}

/// generated route for
/// [_i4.EpisodeView]
class EpisodeRoute extends _i10.PageRouteInfo<void> {
  const EpisodeRoute({List<_i10.PageRouteInfo>? children})
      : super(
          EpisodeRoute.name,
          initialChildren: children,
        );

  static const String name = 'EpisodeRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomeView]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.LocationDetailView]
class LocationDetailRoute extends _i10.PageRouteInfo<LocationDetailRouteArgs> {
  LocationDetailRoute({
    _i11.Key? key,
    required _i14.Location? location,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          LocationDetailRoute.name,
          args: LocationDetailRouteArgs(
            key: key,
            location: location,
          ),
          initialChildren: children,
        );

  static const String name = 'LocationDetailRoute';

  static const _i10.PageInfo<LocationDetailRouteArgs> page =
      _i10.PageInfo<LocationDetailRouteArgs>(name);
}

class LocationDetailRouteArgs {
  const LocationDetailRouteArgs({
    this.key,
    required this.location,
  });

  final _i11.Key? key;

  final _i14.Location? location;

  @override
  String toString() {
    return 'LocationDetailRouteArgs{key: $key, location: $location}';
  }
}

/// generated route for
/// [_i7.LocationView]
class LocationRoute extends _i10.PageRouteInfo<void> {
  const LocationRoute({List<_i10.PageRouteInfo>? children})
      : super(
          LocationRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocationRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SearchView]
class SearchRoute extends _i10.PageRouteInfo<void> {
  const SearchRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SplashView]
class SplashRoute extends _i10.PageRouteInfo<void> {
  const SplashRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
