import 'package:flutter/material.dart';
import 'package:flutter_practice/state/state.dart';

class ShareStateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Share State'),
        ),
        body: ValueWidget(
          color: Colors.grey,
          child: ValueWidget(
            color: Colors.orange,
            child: IWidget(
              value: "BBB",
              child: ValueWidget(
                color: Colors.blue,
                child: ValueWidget(color: Colors.green),
              ),
            ),
          ),
        ));
  }
}
