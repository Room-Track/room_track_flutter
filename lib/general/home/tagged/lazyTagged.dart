import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:room_track_flutter/general/home/tagged/skeleton.dart';
import 'package:room_track_flutter/general/home/tagged/taggedGrid.dart';
import 'package:room_track_flutter/http/get.dart';
import 'package:room_track_flutter/models/cards.dart';

class LazyTaggeds extends ConsumerStatefulWidget {
  const LazyTaggeds({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LazyTaggeds();
}

class _LazyTaggeds extends ConsumerState<ConsumerStatefulWidget> {
  late Future<List<CardInfo>> _futureCards;

  @override
  void initState() {
    super.initState();
    _futureCards = httpReuestTaggeds(ref);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _futureCards,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const TaggedSkeleton();
          } else if (snapshot.hasData) {
            return Taggedgrid(tagged: snapshot.data!);
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
