import 'package:clean_arch_expert/core/injection/container_injection.dart';
import 'package:clean_arch_expert/features/auth/presenter/controllers/login_controller.dart';
import 'package:clean_arch_expert/features/auth/presenter/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  ContainerInjection.setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Arch Experts',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(controller: i.get<LoginController>()),
    );
  }
}
