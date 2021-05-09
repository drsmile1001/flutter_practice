import 'package:flutter/material.dart';

import 'counter.dart';
import 'layout-tutorial.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _selectedPage;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Practice',
        home: Navigator(
          pages: [
            MaterialPage(
                key: ValueKey('ListPage'),
                child: MenuScreen(
                  pageNames: ['Counter', 'LayoutPractice'],
                  onTapped: (page) {
                    setState(() {
                      _selectedPage = page;
                    });
                  },
                )),
            if (_selectedPage == 'LayoutPractice')
              MaterialPage(
                  key: ValueKey(_selectedPage), child: LayoutPractice())
            else if (_selectedPage == 'Counter')
              MaterialPage(key: ValueKey(_selectedPage), child: Counter())
          ],
          onPopPage: (route, result) {
            if (!route.didPop(result)) return false;
            setState(() {
              _selectedPage = null;
            });
            return true;
          },
        ));
  }
}

class MenuScreen extends StatelessWidget {
  final List<String> pageNames;
  final ValueChanged<String> onTapped;
  MenuScreen({required this.pageNames, required this.onTapped});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: pageNames
              .map((name) =>
                  ListTile(title: Text(name), onTap: () => onTapped(name)))
              .toList(),
        ));
  }
}

void main() {
  runApp(MyApp());
}
