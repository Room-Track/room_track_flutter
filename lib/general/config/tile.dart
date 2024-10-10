import 'package:flutter/material.dart';
import 'package:room_track_flutter/colors.dart';

class SettingsTile extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      leading: Icon(icon, color: iconColor),
      title: Text(
        title,
        style: const TextStyle(color: AppColors.white),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: AppColors.white150),
      onTap: onTap,
    );
  }
}