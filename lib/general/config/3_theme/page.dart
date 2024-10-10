import 'package:flutter/material.dart';
import 'package:room_track_flutter/colors.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme"),
        backgroundColor: AppColors.black,
      ),
      backgroundColor: AppColors.black,
    );
  }
}
