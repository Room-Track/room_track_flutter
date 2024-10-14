import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:room_track_flutter/colors.dart';
import 'package:room_track_flutter/fonts.dart';
import 'package:room_track_flutter/models/preferences.dart';

class FontPage extends ConsumerStatefulWidget {
  const FontPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FontPageState();
}

class _FontPageState extends ConsumerState<ConsumerStatefulWidget> {
  String _selectedFontSize = "";

  final List<Map<String, double>> _fontSizes = [
    {'Small': AppFonts.small},
    {'Medium': AppFonts.medium},
    {'Large': AppFonts.large},
    {'Extra Large': AppFonts.extraLage},
  ];

  void _changeFonts(String scheme) {
    ref.read(preferencesProvider).fontScheme = scheme;
  }

  @override
  Widget build(BuildContext context) {
    final colorSchemeName = ref.watch(preferencesProvider).colorScheme;
    final colorScheme = AppColors.schemes[colorSchemeName]!;
    _selectedFontSize = ref.watch(preferencesProvider).fontScheme;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: colorScheme['text'],
        title: const Text('Font Size'),
        backgroundColor: colorScheme['back'],
      ),
      backgroundColor: colorScheme['back'],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select your preferred font size',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: colorScheme['text'],
              ),
            ),
            const SizedBox(height: 20),
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
                        color: colorScheme['text'],
                        fontSize: fontSizeValue,
                      ),
                    ),
                    trailing: _selectedFontSize == fontSizeName
                        ? Icon(Icons.check, color: colorScheme['primary'])
                        : null,
                    onTap: () {
                      setState(() {
                        _selectedFontSize = fontSizeName;
                        _changeFonts(fontSizeName);
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
