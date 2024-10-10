import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardInfo {
  String name;
  String icon;
  bool isTagged;

  CardInfo({
    required this.name,
    required this.icon,
    required this.isTagged,
  });

  factory CardInfo.fromJson(Map<String, dynamic> json) {
    return CardInfo(
        name: json['name'], icon: json['icon'], isTagged: json['isTagged']);
  }
}

class CardModel extends ChangeNotifier {
  List<CardInfo> historyCards;
  int maxHistoryLength = 4;

  CardModel({
    required this.historyCards,
  });

  void pushHistory(CardInfo card) {
    historyCards.add(card);
    if (historyCards.length > maxHistoryLength) {
      historyCards.removeAt(0);
    }
    notifyListeners();
  }
}

final cardProvider = ChangeNotifierProvider<CardModel>((ref) {
  return CardModel(
    historyCards: [],
  );
});
