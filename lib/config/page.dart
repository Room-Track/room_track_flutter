import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings Screen',
      theme: ThemeData.dark(), // Tema oscuro
      home: const SettingsPage(),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuration'), // Título de la AppBar
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0), // Espacio alrededor de la lista
        children: [
          // Sección de Configuración
          const SectionHeader(title: 'Configuration'),
          SettingsTile(
            icon: Icons.person_outline,
            title: 'Profile',
            onTap: () {
              // Acción cuando se selecciona la opción
            },
          ),
          SettingsTile(
            icon: Icons.language_outlined,
            title: 'Language',
            onTap: () {
              // Acción cuando se selecciona la opción
            },
          ),
          SettingsTile(
            icon: Icons.text_fields_outlined,
            title: 'Font size',
            onTap: () {
              // Acción cuando se selecciona la opción
            },
          ),
          SettingsTile(
            icon: Icons.nightlight_outlined,
            title: 'Theme',
            onTap: () {
              // Acción cuando se selecciona la opción
            },
          ),
          const Divider(height: 30), // Línea divisora

          // Sección de Acerca de
          const SectionHeader(title: 'About'),
          SettingsTile(
            icon: Icons.lightbulb_outline,
            title: 'Usage Tips',
            onTap: () {
              // Acción cuando se selecciona la opción
            },
          ),
          SettingsTile(
            icon: Icons.share_outlined,
            title: 'Share',
            onTap: () {
              // Acción cuando se selecciona la opción
            },
          ),
          SettingsTile(
            icon: Icons.contact_support_outlined,
            title: 'Contact Us',
            onTap: () {
              // Acción cuando se selecciona la opción
            },
          ),
          SettingsTile(
            icon: Icons.phone_iphone_outlined,
            title: 'Version',
            onTap: () {
              // Acción cuando se selecciona la opción
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Acción del botón flotante (puede ser para regresar o realizar alguna acción)
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}

// Widget para el encabezado de cada sección
class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}

// Widget reutilizable para cada elemento de la configuración
class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const SettingsTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      leading: Icon(icon, color: Colors.blue),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
      onTap: onTap, // Acción al tocar
    );
  }
}
