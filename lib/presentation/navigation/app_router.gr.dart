// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:movie_app/domain/entity/movie_entity.dart' as _i6;
import 'package:movie_app/presentation/screens/detail/detail_screen.dart'
    as _i1;
import 'package:movie_app/presentation/screens/home/home_screen.dart' as _i2;
import 'package:movie_app/presentation/screens/youtube_screen/youtube_full_screen.dart'
    as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    DetailRoute.name: (routeData) {
      final args = routeData.argsAs<DetailRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.DetailScreen(
          key: args.key,
          movie: args.movie,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    YoutubeFullRoute.name: (routeData) {
      final args = routeData.argsAs<YoutubeFullRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.YoutubeFullScreen(
          key: args.key,
          videoId: args.videoId,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.DetailScreen]
class DetailRoute extends _i4.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({
    _i5.Key? key,
    required _i6.MovieEntity movie,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          DetailRoute.name,
          args: DetailRouteArgs(
            key: key,
            movie: movie,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailRoute';

  static const _i4.PageInfo<DetailRouteArgs> page =
      _i4.PageInfo<DetailRouteArgs>(name);
}

class DetailRouteArgs {
  const DetailRouteArgs({
    this.key,
    required this.movie,
  });

  final _i5.Key? key;

  final _i6.MovieEntity movie;

  @override
  String toString() {
    return 'DetailRouteArgs{key: $key, movie: $movie}';
  }
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.YoutubeFullScreen]
class YoutubeFullRoute extends _i4.PageRouteInfo<YoutubeFullRouteArgs> {
  YoutubeFullRoute({
    _i5.Key? key,
    required String videoId,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          YoutubeFullRoute.name,
          args: YoutubeFullRouteArgs(
            key: key,
            videoId: videoId,
          ),
          initialChildren: children,
        );

  static const String name = 'YoutubeFullRoute';

  static const _i4.PageInfo<YoutubeFullRouteArgs> page =
      _i4.PageInfo<YoutubeFullRouteArgs>(name);
}

class YoutubeFullRouteArgs {
  const YoutubeFullRouteArgs({
    this.key,
    required this.videoId,
  });

  final _i5.Key? key;

  final String videoId;

  @override
  String toString() {
    return 'YoutubeFullRouteArgs{key: $key, videoId: $videoId}';
  }
}
