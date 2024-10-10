import 'package:flutter/material.dart';
import 'package:room_track_flutter/colors.dart';


class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String _selectedLanguage = 'English'; // Idioma por defecto

  final List<String> _languages = ['English', 'Spanish', 'French', 'German', 'Chinese'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language'),
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
              'Select your language',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            // Lista de opciones de idiomas
            Expanded(
              child: ListView.builder(
                itemCount: _languages.length,
                itemBuilder: (context, index) {
                  final language = _languages[index];
                  return ListTile(
                    title: Text(
                      language,
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: _selectedLanguage == language
                        ? const Icon(Icons.check, color: Colors.blue)
                        : null,
                    onTap: () {
                      setState(() {
                        _selectedLanguage = language;
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

