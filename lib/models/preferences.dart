import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:room_track_flutter/colors.dart';
import 'package:room_track_flutter/fonts.dart';

class PreferencesModel extends ChangeNotifier {
  String fontScheme;
  String colorScheme;

  PreferencesModel({
    required this.fontScheme,
    required this.colorScheme,
  });

  void changeColorScheme(String scheme) {
    colorScheme = AppColors.schemes.keys.contains(scheme) ? scheme : "system";
    notifyListeners();
  }

  void changeFontScheme(String scheme) {
    colorScheme = AppFonts.schemes.keys.contains(scheme) ? scheme : "medium";

    notifyListeners();
  }
}

final preferencesProvider = ChangeNotifierProvider<PreferencesModel>((ref) {
  return PreferencesModel(
    fontScheme: "Medium",
    colorScheme: "Dark",
  );
});


