import 'package:flutter/material.dart';
import 'general/layout.dart';
import 'login/page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: ThemeData.dark(),
      home: const LoginPage(),
      routes: <String, WidgetBuilder>{
        "/login": (BuildContext context) => const LoginPage(),
        "/home": (BuildContext context) => const HomeLayout(),
      },
    );
  }
}
