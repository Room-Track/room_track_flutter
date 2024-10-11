import 'package:flutter/material.dart';
import 'package:room_track_flutter/general/home/search/listTile.dart';
import 'package:room_track_flutter/models/cards.dart';

class SearchList extends StatelessWidget {
  final List<CardInfo> list;
  const SearchList({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...list.map((card) {
          return SearchTile(info: card);
        }),
      ],
    );
  }
}
