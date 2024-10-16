import 'package:flutter/material.dart';
import 'package:room_track_flutter/colors.dart';
import 'package:url_launcher/url_launcher.dart'; // Importa el paquete url_launcher

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
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
              'Need help? Contact us!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            // Botón para enviar correo electrónico
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.email),
                label: const Text('Send Email'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  _sendEmail();
                },
              ),
            ),
            const SizedBox(height: 20),

            // Botón para visitar el sitio web de soporte
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.web),
                label: const Text('Instagram'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  _launchSupportWebsite();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Función para enviar un correo electrónico
  void _sendEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'support@example.com', // Cambia esto por tu correo de soporte
      query: 'subject=App Support&body=Hello, I need help with...', // Asunto y cuerpo del correo
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      throw 'Could not launch $emailLaunchUri';
    }
  }

  // Función para abrir el sitio web de soporte
  void _launchSupportWebsite() async {
    const String url = 'https://example.com/support'; // Cambia por tu URL de soporte
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
