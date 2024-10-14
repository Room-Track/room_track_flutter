import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:room_track_flutter/colors.dart';
import 'package:room_track_flutter/general/home/search/searchList.dart';
import 'package:room_track_flutter/general/home/search/skeletonList.dart';
import 'package:room_track_flutter/http/get.dart';
import 'package:room_track_flutter/models/cards.dart';
import 'package:room_track_flutter/models/search.dart';

class LazySearchList extends ConsumerStatefulWidget {
  const LazySearchList({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LazySearchList();
}

class _LazySearchList extends ConsumerState<ConsumerStatefulWidget> {
  late Future<List<CardInfo>> _futureListTile;
  @override
  void initState() {
    super.initState();
    _futureListTile = Future<List<CardInfo>>(() => []);
  }

  void _updateFutureListTile(String query) {
    _futureListTile = httpRequestSearch(query);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final query = ref.watch(searchQueryProvider).query;

    if (query != '') {
      _updateFutureListTile(query);
    }

    return FutureBuilder(
      future: _futureListTile,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SkeletonList();
        } else if (snapshot.hasData) {
          return SearchList(list: snapshot.data!);
        } else {
          return const Center(
            child: Text(
              "No response from server..",
              style: TextStyle(
                color: AppColors.brightBlue,
              ),
            ),
          );
        }
      },
    );
  }
}
