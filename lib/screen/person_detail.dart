import 'package:flutter/material.dart';

class PersonDetailScreen extends StatelessWidget {
  final String id;

  PersonDetailScreen({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Person Detail'),
        ),
        body: Container(
          child: Text('Person:$id'),
        ));
  }
}
