import 'package:flutter/material.dart';
import 'route_config.dart';

class AppRouterDelegate extends RouterDelegate<RouteConfig>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteConfig> {
  static final AppRouterDelegate instance = AppRouterDelegate._();

  final GlobalKey<NavigatorState> navigatorKey;

  AppRouterDelegate._() : navigatorKey = GlobalKey<NavigatorState>();

  RouteConfig _routeConfig = HomeRoute();

  RouteConfig get currentConfiguration {
    return _routeConfig;
  }

  @override
  Widget build(BuildContext context) {
    List<Page<dynamic>> pages = [];
    RouteConfig? pickConfig = _routeConfig;
    while (true) {
      if (pickConfig == null) break;
      pages.add(MaterialPage(
        key: ValueKey(pickConfig.location()),
        child: pickConfig.buildScreen(),
      ));

      pickConfig = pickConfig.parent();
    }

    return Navigator(
      key: navigatorKey,
      pages: pages.reversed.toList(),
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        print("onPopPage");
        final newRouteConfig = _routeConfig.parent();
        if (newRouteConfig == null) return false;
        _routeConfig = newRouteConfig;
        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(RouteConfig path) async {
    print("setNewRoutePath");
    _routeConfig = path;
    notifyListeners();
  }
}
