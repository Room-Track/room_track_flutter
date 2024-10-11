import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardInfo {
  String name;
  String icon;
  bool isTagged;
  String type;

  CardInfo({
    required this.name,
    required this.icon,
    required this.isTagged,
    required this.type,
  });

  factory CardInfo.fromJson(Map<String, dynamic> json) {
    return CardInfo(
        name: json['name'],
        icon: json['icon'],
        isTagged: json['isTagged'],
        type: json['type']);
  }
}

class CardModel extends ChangeNotifier {
  List<CardInfo> historyCards;
  int maxHistoryLength = 4;

  CardModel({
    required this.historyCards,
  });

  void pushHistory(CardInfo card) {
    if (historyCards.indexWhere((cardIt) => cardIt.name == card.name) != -1) {
      return;
    }
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
