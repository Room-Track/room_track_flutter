import 'package:flutter/material.dart';
import 'package:room_track_flutter/colors.dart';

class SkeletonTile extends StatelessWidget {
  const SkeletonTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: AppColors.lightBlue.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      subtitle: Text(
        "Loading..",
        style: TextStyle(
          color: AppColors.lightBlue.withOpacity(0.2),
        ),
      ),
      title: Text(
        "XXXX",
        style: TextStyle(
          color: AppColors.lightBlue.withOpacity(0.2),
        ),
      ),
      trailing: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: AppColors.lightBlue.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onTap: () {},
    );
  }
}
