import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:room_track_flutter/models/cards.dart';

class InfoPage extends ConsumerWidget {
  final CardInfo info;
  const InfoPage({
    super.key,
    required this.info,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Info ${info.name}"),
      ),
      body: Text(info.name),
    );
  }
}
