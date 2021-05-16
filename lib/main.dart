import 'package:flutter/material.dart';
import 'package:flutter_practice/navigator/route_Information_parser.dart';
import 'navigator/router_delegate.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Practice',
      routerDelegate: AppRouterDelegate.instance,
      routeInformationParser: AppRouteInformationParser.instance,
    );
  }
}

void main() {
  runApp(MyApp());
}
