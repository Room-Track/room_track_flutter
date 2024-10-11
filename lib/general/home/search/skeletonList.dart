import 'package:flutter/material.dart';
import 'package:room_track_flutter/general/home/search/skeletonTile.dart';

class SkeletonList extends StatelessWidget {
  const SkeletonList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(10, (idx) {
        return const SkeletonTile();
      }),
    );
  }
}
