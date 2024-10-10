import 'package:flutter/material.dart';
import 'package:room_track_flutter/colors.dart';

class VersionPage extends StatelessWidget {
  const VersionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Version'),
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
          children: const [
            Text(
              'App Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),

            // Mostrar la versión de la app fija
            Text(
              'Version: 0.0.1', // Texto fijo de la versión
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),

            SizedBox(height: 10),

            // Mostrar el número de compilación fijo
            Text(
              'Build Number: 1', // Texto fijo del número de compilación
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
