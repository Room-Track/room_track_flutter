import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:room_track_flutter/colors.dart';

class SearchTile extends StatelessWidget {
  const SearchTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      leading: SvgPicture.asset(
        'assets/room.svg',
        width: 30,
        height: 30,
      ),
      subtitle: const Text(
        "ClassRoom",
        style: TextStyle(
          color: AppColors.grey,
        ),
      ),
      title: const Text(
        "M203",
        style: TextStyle(color: AppColors.white),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.pin_drop,
          size: 30,
        ),
      ),
      onTap: () {},
    );
  }
}
