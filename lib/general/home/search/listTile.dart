import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:room_track_flutter/colors.dart';
import 'package:room_track_flutter/general/home/cardRoom.dart';
import 'package:room_track_flutter/models/cards.dart';

class SearchTile extends ConsumerWidget {
  final CardInfo info;
  const SearchTile({
    super.key,
    required this.info,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      leading: SvgPicture.asset(
        info.icon,
        width: 30,
        height: 30,
      ),
      subtitle: Text(
        info.type,
        style: const TextStyle(
          color: AppColors.grey,
        ),
      ),
      title: Text(
        info.name,
        style: const TextStyle(color: AppColors.white),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.pin_drop,
          size: 30,
        ),
      ),
      onTap: () {
        goToInfoPage(context, ref, info);
      },
    );
  }
}
