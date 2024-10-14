import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:room_track_flutter/colors.dart';
import 'package:room_track_flutter/models/preferences.dart';

class SkeletonTile extends ConsumerWidget {
  const SkeletonTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorSchemeName = ref.watch(preferencesProvider).colorScheme;
    final colorScheme = AppColors.schemes[colorSchemeName]!;
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: colorScheme['secondary']?.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      subtitle: Text(
        "Loading..",
        style: TextStyle(
          color: colorScheme['secondary']?.withOpacity(0.2),
        ),
      ),
      title: Text(
        "XXXX",
        style: TextStyle(
          color: colorScheme['secondary']?.withOpacity(0.2),
        ),
      ),
      trailing: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: colorScheme['secondary']?.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onTap: () {},
    );
  }
}
