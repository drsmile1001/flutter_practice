import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            Text('value:${Provider.of<String>(context)}'),
            if (child != null) child!
          ],
        ),
      ),
    );
  }
}
