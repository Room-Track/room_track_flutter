import 'package:flutter/material.dart';

class SkeletonList extends StatelessWidget {
  const SkeletonList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("Hola 1"),
        Text("Hola 2"),
        Text("Hola 3"),
        Text("Hola 4"),
        Text("Hola 5"),
      ],
    );
  }
}
