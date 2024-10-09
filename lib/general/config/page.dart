import 'package:flutter/material.dart';
import 'package:room_track_flutter/colors.dart';
import 'tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: ListView(
        padding: const EdgeInsets.all(20.0), // Espacio alrededor de la lista
        children: [
          // Sección de Configuración
          const SectionHeader(title: 'General'),
          SettingsTile(
            icon: Icons.person_outline,
            iconColor: AppColors.darkBlue,
            title: 'Profile',
            onTap: () {
              // TODO Acción cuando se selecciona la opción
            },
          ),
          SettingsTile(
            icon: Icons.language_outlined,
            iconColor: AppColors.darkBlue,
            title: 'Language',
            onTap: () {
              // TODO Acción cuando se selecciona la opción
            },
          ),
          SettingsTile(
            icon: Icons.text_fields_outlined,
            iconColor: AppColors.darkBlue,
            title: 'Font size',
            onTap: () {
              // TODO Acción cuando se selecciona la opción
            },
          ),
          SettingsTile(
            icon: Icons.nightlight_outlined,
            iconColor: AppColors.darkBlue,
            title: 'Theme',
            onTap: () {
              // TODO Acción cuando se selecciona la opción
            },
          ),
          const Divider(height: 30),

          // Sección About
          const SectionHeader(title: 'About'),
          SettingsTile(
            icon: Icons.lightbulb_outline,
            iconColor: AppColors.darkBlue,
            title: 'Usage Tips',
            onTap: () {
              // TODO Acción cuando se selecciona la opción
            },
          ),
          SettingsTile(
            icon: Icons.share_outlined,
            iconColor: AppColors.darkBlue,
            title: 'Share',
            onTap: () {
              // TODO Acción cuando se selecciona la opción
            },
          ),
          SettingsTile(
            icon: Icons.contact_support_outlined,
            iconColor: AppColors.darkBlue,
            title: 'Contact Us',
            onTap: () {
              // TODO Acción cuando se selecciona la opción
            },
          ),
          SettingsTile(
            icon: Icons.phone_iphone_outlined,
            iconColor: AppColors.darkBlue,
            title: 'Version',
            onTap: () {
              // TODO Acción cuando se selecciona la opción
            },
          ),
        ],
      ),
    );
  }
}

// Widget para el encabezado de cada sección
class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
