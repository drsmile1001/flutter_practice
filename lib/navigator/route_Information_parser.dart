import 'package:flutter/material.dart';
import 'route_config.dart';

class AppRouteInformationParser extends RouteInformationParser<RouteConfig> {
  static final AppRouteInformationParser instance =
      AppRouteInformationParser._();

  AppRouteInformationParser._();

  @override
  Future<RouteConfig> parseRouteInformation(
      RouteInformation routeInformation) async {
    print("parseRouteInformation");
    final location = routeInformation.location ?? '/';
    final uri = Uri.parse(location);

    if (location == HomeRoute().location()) return HomeRoute();
    if (location == CounterRoute().location()) return CounterRoute();
    if (location == LayoutDemoRoute().location()) return LayoutDemoRoute();


    // Handle unknown routes
    return NotFoundRoute();
  }

  @override
  RouteInformation restoreRouteInformation(RouteConfig path) {
    print("restoreRouteInformation");
    return RouteInformation(location: path.location());
  }
}
