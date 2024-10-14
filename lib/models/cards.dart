import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardInfo {
  String name;
  String icon;
  bool isTagged;
  String type;
  String gloc;

  CardInfo({
    required this.name,
    required this.icon,
    required this.isTagged,
    required this.type,
    required this.gloc,
  });

  factory CardInfo.fromJson(Map<String, dynamic> json, bool tagged) {
    return CardInfo(
        name: json['name'],
        icon: json['icon'],
        isTagged: tagged,
        type: json['type'],
        gloc: json['gloc']);
  }
}

class CardModel extends ChangeNotifier {
  List<CardInfo> historyCards;
  int maxHistoryLength = 4;
  bool change;

  CardModel({
    required this.historyCards,
    required this.change,
  });

  void notifyChangeOnTag() {
    change = !change;
    notifyListeners();
  }

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
    change: false,
  );
});
