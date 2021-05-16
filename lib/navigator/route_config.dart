import 'package:flutter/material.dart';
import 'package:flutter_practice/counter.dart';
import 'package:flutter_practice/layout-tutorial.dart';
import 'package:flutter_practice/screen/menu.dart';

abstract class RouteConfig {
  String location();
  RouteConfig? parent();
  Widget buildScreen();
}

class HomeRoute extends RouteConfig {
  @override
  String location() => '/';

  @override
  RouteConfig? parent() => null;

  @override
  Widget buildScreen() => MenuScreen();
}

class CounterRoute extends RouteConfig {
  @override
  String location() => '/counter';

  @override
  RouteConfig? parent() => HomeRoute();

  @override
  Widget buildScreen() => Counter();
}

class LayoutDemoRoute extends RouteConfig {
  @override
  String location() => '/layout-demo';

  @override
  RouteConfig? parent() => HomeRoute();

  @override
  Widget buildScreen() => LayoutPractice();
}

class NotFoundRoute extends RouteConfig {
  @override
  String location() => '/404';

  @override
  RouteConfig? parent() => HomeRoute();

  @override
  Widget buildScreen() => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text('404!'),
        ),
      );
}
