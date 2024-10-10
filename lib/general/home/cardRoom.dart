import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:room_track_flutter/colors.dart';
import 'package:room_track_flutter/elevations.dart';

class Cardroom extends StatelessWidget {
  final String name;
  final String icon;
  final bool isTagged;
  final GestureTapCallback onTapF;

  const Cardroom({
    super.key,
    required this.name,
    required this.isTagged,
    required this.icon,
    required this.onTapF,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.darkGrey,
      clipBehavior: Clip.hardEdge,
      elevation: AppElevations.m2,
      child: InkWell(
          onTap: onTapF,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: 190,
              height: 140,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child:
                        Icon(isTagged ? Icons.star_sharp : Icons.star_outline),
                  ),
                  SvgPicture.asset(
                    icon,
                    width: 60,
                    height: 60,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      name,
                      style: const TextStyle(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
