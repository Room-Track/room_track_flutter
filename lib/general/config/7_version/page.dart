import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:room_track_flutter/colors.dart';
import 'package:room_track_flutter/models/preferences.dart';

class VersionPage extends ConsumerWidget {
  const VersionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorSchemeName = ref.watch(preferencesProvider).colorScheme;
    final colorScheme = AppColors.schemes[colorSchemeName]!;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: colorScheme['text'],
        backgroundColor: colorScheme['back'],
        title: const Text('App Version'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Volver a la página anterior
          },
        ),
      ),
      backgroundColor: colorScheme['back'],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'App Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: colorScheme['text'],
              ),
            ),
            const SizedBox(height: 20),

            // Mostrar la versión de la app fija
            Text(
              'Version: 0.0.1', // Texto fijo de la versión
              style: TextStyle(color: colorScheme['text'], fontSize: 18),
            ),

            const SizedBox(height: 10),

            // Mostrar el número de compilación fijo
            Text(
              'Build Number: 1', // Texto fijo del número de compilación
              style: TextStyle(color: colorScheme['text'], fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
