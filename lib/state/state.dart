import 'package:flutter/material.dart';

class IWidget extends InheritedWidget {
  final String value;
  IWidget({required this.value, required Widget child}) : super(child: child);

  static IWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<IWidget>();
  }

  @override
  bool updateShouldNotify(IWidget oldWidget) {
    return oldWidget.value != value;
  }
}

class ValueWidget extends StatelessWidget {
  final Widget? child;
  final Color color;
  ValueWidget({Key? key, this.child, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      color: color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (IWidget.of(context) != null)
              Text('value:${IWidget.of(context)!.value}')
            else
              Text('value:null'),
            if (child != null) child!
          ],
        ),
      ),
    );
  }
}
