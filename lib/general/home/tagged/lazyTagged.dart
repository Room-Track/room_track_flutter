import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:room_track_flutter/general/home/tagged/page.dart';
import 'package:room_track_flutter/general/home/tagged/skeleton.dart';
import 'package:room_track_flutter/general/home/tagged/taggedGrid.dart';
import 'package:room_track_flutter/http/get.dart';
import 'package:room_track_flutter/models/cards.dart';

void goToTaggedsPage(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const TaggedsPage()));
}

class LazyTaggeds extends ConsumerStatefulWidget {
  final int limit;
  const LazyTaggeds({
    super.key,
    required this.limit,
  });
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      // ignore: no_logic_in_create_state
      _LazyTaggeds(limit: limit);
}

class _LazyTaggeds extends ConsumerState<ConsumerStatefulWidget> {
  late Future<List<CardInfo>> _futureCards;
  final int limit;

  _LazyTaggeds({
    required this.limit,
  });

  @override
  void initState() {
    super.initState();
    _futureCards = httpRequestTaggedsLimit(limit);
  }

  void _updateFutureCards() {
    _futureCards = httpRequestTaggedsLimit(limit);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final changeOntag = ref.watch(cardProvider).change;
    print(changeOntag);
    if (changeOntag) {
      _updateFutureCards();
      ref.read(cardProvider).change = false;
    }

    return FutureBuilder(
        future: _futureCards,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const TaggedSkeleton();
          } else if (snapshot.hasData) {
            return Taggedgrid(
              tagged: snapshot.data!,
              moreButton: limit != 0,
            );
          }

          return const SizedBox(
            height: 400,
            child: Center(
              child: Text("the server does not respond.."),
            ),
          );
        });
  }
}
