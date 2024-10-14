import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:room_track_flutter/colors.dart';
import 'package:room_track_flutter/general/home/info/page.dart';
import 'package:room_track_flutter/http/get.dart';
import 'package:room_track_flutter/models/cards.dart';

class LazyInfoPage extends ConsumerStatefulWidget {
  final String name;
  const LazyInfoPage({
    super.key,
    required this.name,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LazyInfoPage(name: name);
}

class _LazyInfoPage extends ConsumerState<ConsumerStatefulWidget> {
  late Future<List<CardInfo>> _futureInfo;
  final String name;
  _LazyInfoPage({
    required this.name,
  });

  @override
  void initState() {
    super.initState();
    _futureInfo = httpRequestCard(name);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _futureInfo,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              backgroundColor: AppColors.black,
              body: Center(
                child: CircularProgressIndicator(
                  color: AppColors.brightBlue,
                ),
              ),
            );
          } else if (snapshot.hasData) {
            return InfoPage(info: snapshot.data!.first);
          }

          return const Text("Server not responding..");
        });
  }
}
