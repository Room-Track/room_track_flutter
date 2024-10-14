import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:room_track_flutter/colors.dart';
import 'package:room_track_flutter/models/preferences.dart';

class UsagePage extends ConsumerWidget {
  const UsagePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorSchemeName = ref.watch(preferencesProvider).colorScheme;
    final colorScheme = AppColors.schemes[colorSchemeName]!;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: colorScheme['text'],
        backgroundColor: colorScheme['back'],
        title: const Text("Usage"),
      ),
      backgroundColor: colorScheme['back'],
    );
  }
}
