import 'package:flutter/material.dart';
import 'package:flutter_practice/navigator/route_config.dart';
import 'package:flutter_practice/navigator/router_delegate.dart';

class PersonListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Persons'),
        ),
        body: ListView(
          children: [
            ListTile(
                title: Text("Alice"),
                onTap: () => AppRouterDelegate.instance
                    .setNewRoutePath(PersonDetailRoute("alice_id"))),
            ListTile(
                title: Text("Bob"),
                onTap: () => AppRouterDelegate.instance
                    .setNewRoutePath(PersonDetailRoute("bob_id")))
          ],
        ));
  }
}
