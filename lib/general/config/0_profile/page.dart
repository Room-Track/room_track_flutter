import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart'; // Material Design
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:room_track_flutter/colors.dart';
import 'package:room_track_flutter/general/config/tile.dart';
import 'package:room_track_flutter/models/preferences.dart';

class ProfilePage extends ConsumerWidget {
  ProfilePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  String getUserName(String email) {
    return email.substring(0, email.indexOf("@"));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorSchemeName = ref.watch(preferencesProvider).colorScheme;
    final colorScheme = AppColors.schemes[colorSchemeName]!;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: colorScheme['text'],
        title: const Text('Profile'),
        backgroundColor: colorScheme['back'],
      ),
      backgroundColor: colorScheme['back'],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Imagen de perfil con botón para cambiar la foto
              Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage:
                        const AssetImage('assets/profile_placeholder.png'),
                    backgroundColor: colorScheme['neutral2'],
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(Icons.camera_alt, color: colorScheme['text']),
                      onPressed: () {
                        //TODO Acción para cambiar la imagen
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Nombre del usuario
              Text(
                getUserName(user.email!),
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: colorScheme['text']),
              ),
              const SizedBox(height: 10),

              // Correo del usuario
              Text(
                user.email!,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(height: 20),

              // Botón para editar la información
              ElevatedButton.icon(
                icon: Icon(
                  Icons.edit,
                  color: colorScheme['secondary'],
                ),
                label: Text(
                  'Edit Profile',
                  style: TextStyle(color: colorScheme['secondary']),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme['neutral2'],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // TODO Acción para editar el perfil
                },
              ),
              const SizedBox(height: 30),

              // Opciones adicionales (Cambiar contraseña, Cerrar sesión)
              Divider(
                color: colorScheme['neutral2'],
              ),
              SettingsTile(
                icon: Icons.lock_outline,
                iconColor: colorScheme['primary']!,
                title: 'Change Password',
                onTap: () {
                  // TODO Acción cuando se selecciona la opción
                },
              ),
              SettingsTile(
                icon: Icons.logout,
                iconColor: AppColors.red,
                title: 'Log Out',
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
