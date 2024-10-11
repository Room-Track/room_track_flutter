import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:room_track_flutter/colors.dart';
import 'package:room_track_flutter/models/preferences.dart';
import 'tile.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorSchemeName = ref.watch(preferencesProvider).colorScheme;
    final colorScheme = AppColors.schemes[colorSchemeName]!;
    return Scaffold(
      backgroundColor: colorScheme['back'],
      body: ListView(
        padding: const EdgeInsets.all(20.0), // Espacio alrededor de la lista
        children: [
          // Sección de Configuración
          const SectionHeader(title: 'General'),
          SettingsTile(
            icon: Icons.person_outline,
            iconColor: colorScheme['primary']!,
            title: 'Profile',
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          SettingsTile(
            icon: Icons.language_outlined,
            iconColor: colorScheme['primary']!,
            title: 'Language',
            onTap: () {
              Navigator.pushNamed(context, '/language');
            },
          ),
          SettingsTile(
            icon: Icons.text_fields_outlined,
            iconColor: colorScheme['primary']!,
            title: 'Font size',
            onTap: () {
              Navigator.pushNamed(context, '/font');
            },
          ),
          SettingsTile(
            icon: Icons.nightlight_outlined,
            iconColor: colorScheme['primary']!,
            title: 'Theme',
            onTap: () {
              Navigator.pushNamed(context, '/theme');
            },
          ),
          const Divider(height: 30),

          // Sección About
          const SectionHeader(title: 'About'),
          SettingsTile(
            icon: Icons.lightbulb_outline,
            iconColor: colorScheme['primary']!,
            title: 'Usage Tips',
            onTap: () {
              Navigator.pushNamed(context, '/usage');
            },
          ),
          SettingsTile(
            icon: Icons.share_outlined,
            iconColor: colorScheme['primary']!,
            title: 'Share',
            onTap: () {
              Navigator.pushNamed(context, '/share');
            },
          ),
          SettingsTile(
            icon: Icons.contact_support_outlined,
            iconColor: colorScheme['primary']!,
            title: 'Contact Us',
            onTap: () {
              Navigator.pushNamed(context, '/contact');
            },
          ),
          SettingsTile(
            icon: Icons.phone_iphone_outlined,
            iconColor: colorScheme['primary']!,
            title: 'Version',
            onTap: () {
              Navigator.pushNamed(context, '/version');
            },
          ),
        ],
      ),
    );
  }
}

// Widget para el encabezado de cada sección
class SectionHeader extends ConsumerWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorSchemeName = ref.watch(preferencesProvider).colorScheme;
    final colorScheme = AppColors.schemes[colorSchemeName]!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: TextStyle(
          color: colorScheme['text'],
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
