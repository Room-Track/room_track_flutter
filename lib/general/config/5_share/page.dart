import 'package:flutter/material.dart';
import 'package:room_track_flutter/colors.dart';
import 'package:share_plus/share_plus.dart'; // Importa el paquete share_plus

class SharePage extends StatelessWidget {
  const SharePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Share'),
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
              'Share this app with your friends!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            // Botón para compartir
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.share),
                label: const Text('Share App'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
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
