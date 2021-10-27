import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Arch Experts',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
