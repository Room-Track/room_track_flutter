import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:room_track_flutter/colors.dart';
import 'package:room_track_flutter/general/home/cardRoom.dart';
import 'package:room_track_flutter/models/cards.dart';
import 'package:room_track_flutter/models/preferences.dart';

class SearchTile extends ConsumerWidget {
  final CardInfo info;
  const SearchTile({
    super.key,
    required this.info,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorSchemeName = ref.watch(preferencesProvider).colorScheme;
    final colorScheme = AppColors.schemes[colorSchemeName]!;
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      leading: SvgPicture.asset(
        info.icon,
        width: 30,
        height: 30,
        color: colorScheme['text'],
      ),
      subtitle: Text(
        info.type,
        style: TextStyle(
          color: colorScheme['neutral'],
        ),
      ),
      title: Text(
        info.name,
        style: TextStyle(color: colorScheme['text']),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.pin_drop,
          size: 30,
          color: colorScheme['text'],
        ),
      ),
      onTap: () {
        goToInfoPage(context, ref, info);
      },
    );
  }
}
