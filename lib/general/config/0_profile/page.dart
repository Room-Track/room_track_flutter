import 'package:flutter/material.dart'; // Material Design
import 'package:room_track_flutter/colors.dart';
import 'package:room_track_flutter/general/config/tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: AppColors.black,
      ),
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Imagen de perfil con botón para cambiar la foto
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage:
                        AssetImage('assets/profile_placeholder.png'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon:
                          const Icon(Icons.camera_alt, color: AppColors.white),
                      onPressed: () {
                        //TODO Acción para cambiar la imagen
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Nombre del usuario
              const Text(
                'John Doe',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white),
              ),
              const SizedBox(height: 10),

              // Correo del usuario
              const Text(
                'john.doe@example.com',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(height: 20),

              // Botón para editar la información
              ElevatedButton.icon(
                icon: const Icon(
                  Icons.edit,
                  color: AppColors.lightBlue,
                ),
                label: const Text(
                  'Edit Profile',
                  style: TextStyle(color: AppColors.lightBlue),
                ),
                style: ElevatedButton.styleFrom(
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
              const Divider(
                color: AppColors.grey60,
              ),
              SettingsTile(
                icon: Icons.lock_outline,
                iconColor: AppColors.brightBlue,
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
                  // TODO Acción cuando se selecciona la opción
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
