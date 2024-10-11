import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:room_track_flutter/colors.dart';
import 'package:room_track_flutter/general/home/tagged/lazyTagged.dart';

class TaggedsPage extends ConsumerWidget {
  const TaggedsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black,
        title: const Text(
          "Tagged",
          style: TextStyle(
            color: AppColors.white,
          ),
        ),
      ),
      backgroundColor: AppColors.black,
      body: const LazyTaggeds(limit: 0),
    );
  }
}
