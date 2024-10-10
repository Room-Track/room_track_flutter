import 'package:flutter/material.dart';
import 'package:room_track_flutter/colors.dart';

class Cardroom extends StatelessWidget {
  final String name;
  final String icon;
  final bool isTagged;

  const Cardroom({
    super.key,
    required this.name,
    required this.isTagged,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.darkGrey,
      child: Center(
        child: Text(name),
      ),
    );
  }
}
