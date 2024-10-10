import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:room_track_flutter/colors.dart';
import 'package:room_track_flutter/models/preferences.dart';

class ThemePage extends ConsumerStatefulWidget {
  const ThemePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ThemePageState();
}

class _ThemePageState extends ConsumerState<ConsumerStatefulWidget> {
  // Almacena el tema seleccionado
  String _selectedTheme = "";

  final List<Map<String, ThemeMode>> _themes = [
    {'Light': ThemeMode.light},
    {'Dark': ThemeMode.dark},
    {'System': ThemeMode.system},
  ];

  void _changeTheme(String theme) {
    ref.read(preferencesProvider).changeColorScheme(theme);
  }

  @override
  Widget build(BuildContext context) {
    _selectedTheme = ref.watch(preferencesProvider).colorScheme;
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
                        _changeTheme(themeName);
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
}
