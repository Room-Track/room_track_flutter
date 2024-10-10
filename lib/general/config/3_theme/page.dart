import 'package:flutter/material.dart';
import 'package:room_track_flutter/colors.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({super.key});

  @override
  State<StatefulWidget> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  // Almacena el tema seleccionado
  String _selectedTheme = 'System';

  final List<Map<String, ThemeMode>> _themes = [
    {'Light': ThemeMode.light},
    {'Dark': ThemeMode.dark},
    {'System': ThemeMode.system},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Volver a la página anterior
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select your theme',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            // Lista de opciones de tema
            Expanded(
              child: ListView.builder(
                itemCount: _themes.length,
                itemBuilder: (context, index) {
                  final themeName = _themes[index].keys.first;
                  final themeMode = _themes[index].values.first;
                  return ListTile(
                    title: Text(
                      themeName,
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: _selectedTheme == themeName
                        ? const Icon(Icons.check, color: Colors.blue)
                        : null,
                    onTap: () {
                      setState(() {
                        _selectedTheme = themeName;
                        // Aquí puedes aplicar el cambio de tema
                        _changeTheme(context, themeMode);
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Función para cambiar el tema
  void _changeTheme(BuildContext context, ThemeMode themeMode) {
    // Esta función puede ser extendida para actualizar el tema de la app
    // Puedes usar un estado global (como Provider) para aplicar el cambio de tema en toda la app
    // Ejemplo: context.read<ThemeProvider>().setTheme(themeMode);
  }
}
