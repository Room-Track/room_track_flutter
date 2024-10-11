import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchQueryModel extends ChangeNotifier {
  String query;
  SearchQueryModel({
    required this.query,
  });

  void changeQuery(String newQuery) {
    query = newQuery;
    notifyListeners();
  }
}

final searchQueryProvider = ChangeNotifierProvider<SearchQueryModel>((ref) {
  return SearchQueryModel(query: '');
});
