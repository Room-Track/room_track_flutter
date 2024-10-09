import 'package:flutter/material.dart'; // Material Design

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Screen',
      theme: ThemeData.dark(), // Tema oscuro
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'), // Título de la AppBar
      ),
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
                    backgroundImage: AssetImage('assets/profile_placeholder.png'), // Imagen de perfil por defecto
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon: const Icon(Icons.camera_alt, color: Colors.white), // Ícono de Material para la cámara
                      onPressed: () {
                        // Acción para cambiar la imagen
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
                ),
              ),
              const SizedBox(height: 10),

              // Correo del usuario
              const Text(
                'john.doe@example.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),

              // Botón para editar la información
              ElevatedButton.icon(
                icon: const Icon(Icons.edit), // Ícono de Material para editar
                label: const Text('Edit Profile'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // Acción para editar el perfil
                },
              ),
              const SizedBox(height: 30),

              // Opciones adicionales (Cambiar contraseña, Cerrar sesión)
              const Divider(),
              ListTile(
                leading: const Icon(Icons.lock_outline, color: Colors.blue), // Ícono de Material para contraseña
                title: const Text('Change Password'),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                onTap: () {
                  // Acción para cambiar la contraseña
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red), // Ícono de Material para cerrar sesión
                title: const Text('Log Out'),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                onTap: () {
                  // Acción para cerrar sesión
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
