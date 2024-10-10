import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  final String name;
  const InfoPage({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Info $name"),
      ),
      body: Text(name),
    );
  }
}
