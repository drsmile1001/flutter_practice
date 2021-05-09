import 'package:flutter/material.dart';

class CounterDisplay extends StatelessWidget {
  CounterDisplay({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Text('Count: $count');
  }
}

class CounterIncrementor extends StatelessWidget {
  CounterIncrementor({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text('Increment'),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      ++_counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CounterIncrementor(onPressed: _increment),
        SizedBox(width: 16),
        CounterDisplay(count: _counter),
      ],
    );
  }
}

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
                  pageNames: ["aaa", "bbb"],
                  onTapped: (page) {
                    setState(() {
                      _selectedPage = page;
                    });
                  },
                )),
            if (_selectedPage != null)
              MaterialPage(
                  key: ValueKey(_selectedPage),
                  child: Scaffold(appBar: AppBar(), body: Text(_selectedPage!)))
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
