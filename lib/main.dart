import 'package:flutter/material.dart';
import 'package:todoappbloc/pages/pages_shelf.dart';

void main() => runApp( MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todos App',
      home: TodosPage(),
    );
  }
}
