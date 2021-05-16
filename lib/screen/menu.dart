import 'package:flutter/material.dart';
import 'package:flutter_practice/navigator/route_config.dart';
import 'package:flutter_practice/navigator/router_delegate.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            ListTile(
                title: Text("Counter"),
                onTap: () =>
                    AppRouterDelegate.instance.setNewRoutePath(CounterRoute())),
            ListTile(
                title: Text("Layout Demo"),
                onTap: () => AppRouterDelegate.instance
                    .setNewRoutePath(LayoutDemoRoute()))
          ],
        ));
  }
}
