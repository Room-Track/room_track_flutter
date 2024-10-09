import 'package:flutter/material.dart';
import 'config/page.dart'; // Importar la página de configuración
import 'config/profile/page.dart'; // Importar la página de perfil (esto es opcional si no se usa aquí)

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: ThemeData.dark(), // Tema oscuro
      home: const ProfilePage(), // Pantalla principal será la de configuraciones
    );
  }
}
