import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:room_track_flutter/colors.dart';
import 'package:room_track_flutter/models/preferences.dart';
import 'package:share_plus/share_plus.dart'; // Importa el paquete share_plus

class SharePage extends ConsumerWidget {
  const SharePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorSchemeName = ref.watch(preferencesProvider).colorScheme;
    final colorScheme = AppColors.schemes[colorSchemeName]!;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: colorScheme['text'],
        backgroundColor: colorScheme['back'],
        title: const Text('Share'),
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
              'Share this app with your friends!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: colorScheme['text'],
              ),
            ),
            const SizedBox(height: 20),

            // Botón para compartir
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.share),
                label: const Text('Share App'),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  iconColor: colorScheme['secondary'],
                  foregroundColor: colorScheme['secondary'],
                  backgroundColor: colorScheme['neutral2'],
                ),
                onPressed: () {
                  // Acción de compartir
                  _shareApp();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Función para compartir la app
  void _shareApp() {
    Share.share(
      'Check out this amazing app: https://example.com', // Cambia por tu enlace
      subject: 'Amazing App', // Opcional: Asunto del mensaje de compartir
    );
  }
}
