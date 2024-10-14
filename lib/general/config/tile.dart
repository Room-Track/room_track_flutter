import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:room_track_flutter/colors.dart';
import 'package:room_track_flutter/models/preferences.dart';

class SettingsTile extends ConsumerWidget {
  final IconData icon;
  final String title;
  final Color iconColor;
  final VoidCallback onTap;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorSchemeName = ref.watch(preferencesProvider).colorScheme;
    final colorScheme = AppColors.schemes[colorSchemeName]!;
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      leading: Icon(icon, color: iconColor),
      title: Text(
        title,
        style: TextStyle(color: colorScheme['text']),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: colorScheme['neutral']),
      onTap: onTap,
    );
  }
}
