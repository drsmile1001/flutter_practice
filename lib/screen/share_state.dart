import 'package:flutter/material.dart';
import 'package:flutter_practice/state/state.dart';
import 'package:provider/provider.dart';

class ShareStateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Share State'),
        ),
        body: Provider.value(
            value: "AAA",
            child: ValueWidget(
              color: Colors.grey,
              child: ValueWidget(
                color: Colors.orange,
                child: Provider.value(
                  value: "BBB",
                  child: ValueWidget(
                    color: Colors.blue,
                    child: ValueWidget(color: Colors.green),
                  ),
                ),
              ),
            )));
  }
}
