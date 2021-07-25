import 'package:flutter/material.dart';
import 'package:flutter_practice/screen/counter.dart';
import 'package:flutter_practice/screen/layout-tutorial.dart';
import 'package:flutter_practice/screen/menu.dart';
import 'package:flutter_practice/screen/person_detail.dart';
import 'package:flutter_practice/screen/person_list.dart';
import 'package:flutter_practice/screen/share_state.dart';

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

class PersonListRoute extends RouteConfig {
  @override
  String location() => '/person';

  @override
  RouteConfig? parent() => HomeRoute();

  @override
  Widget buildScreen() => PersonListScreen();
}

class PersonDetailRoute extends RouteConfig {
  final String id;

  PersonDetailRoute(this.id);

  @override
  String location() => '/person/$id';

  @override
  RouteConfig? parent() => PersonListRoute();

  @override
  Widget buildScreen() => PersonDetailScreen(id: id);
}

class ShareStateRoute extends RouteConfig {
  @override
  String location() => '/share-state';

  @override
  RouteConfig? parent() => HomeRoute();

  @override
  Widget buildScreen() => ShareStateScreen();
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
