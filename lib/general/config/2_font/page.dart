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
    _selectedFontSize = ref.watch(preferencesProvider).fontScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Font Size'),
        backgroundColor: AppColors.black,
      ),
      backgroundColor: AppColors.black,
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
                        color: AppColors.white,
                        fontSize: fontSizeValue,
                      ),
                    ),
                    trailing: _selectedFontSize == fontSizeName
                        ? const Icon(Icons.check, color: AppColors.brightBlue)
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
