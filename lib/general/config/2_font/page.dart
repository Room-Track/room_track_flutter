import 'package:flutter/material.dart';
import 'package:room_track_flutter/colors.dart';

class FontPage extends StatefulWidget {
  const FontPage({Key? key}) : super(key: key);

  @override
  _FontPageState createState() => _FontPageState();
}

class _FontPageState extends State<FontPage> {
  // Tamaño de fuente seleccionado, por defecto "Medium"
  String _selectedFontSize = 'Medium';

  final List<Map<String, double>> _fontSizes = [
    {'Small': 12.0},
    {'Medium': 16.0},
    {'Large': 20.0},
    {'Extra Large': 24.0},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Font Size'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Vuelve a la página anterior
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select your preferred font size',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            // Lista de tamaños de fuente
            Expanded(
              child: ListView.builder(
                itemCount: _fontSizes.length,
                itemBuilder: (context, index) {
                  final fontSizeName = _fontSizes[index].keys.first;
                  final fontSizeValue = _fontSizes[index].values.first;
                  return ListTile(
                    title: Text(
                      fontSizeName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: fontSizeValue, // Muestra el tamaño de fuente en la lista
                      ),
                    ),
                    trailing: _selectedFontSize == fontSizeName
                        ? const Icon(Icons.check, color: Colors.blue)
                        : null,
                    onTap: () {
                      setState(() {
                        _selectedFontSize = fontSizeName;
                        // Aquí puedes guardar la preferencia de tamaño de fuente
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
