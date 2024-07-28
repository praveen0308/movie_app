import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(initial: true, page: HomeRoute.page),
        AutoRoute(page: DetailRoute.page),
        AutoRoute(page: YoutubeFullRoute.page),
      ];
}
