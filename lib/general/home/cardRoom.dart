import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:room_track_flutter/colors.dart';
import 'package:room_track_flutter/elevations.dart';
import 'package:room_track_flutter/general/home/info/lazyInfo.dart';
import 'package:room_track_flutter/models/cards.dart';
import 'package:room_track_flutter/models/preferences.dart';

void goToInfoPage(BuildContext context, WidgetRef ref, CardInfo info) {
  ref.read(cardProvider).pushHistory(info);
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LazyInfoPage(
                name: info.name,
              )));
}

class Cardroom extends ConsumerWidget {
  final String name;
  final String icon;
  final bool isTagged;
  final bool? hideTag;
  final GestureTapCallback onTapF;

  const Cardroom({
    super.key,
    required this.name,
    required this.isTagged,
    required this.icon,
    required this.onTapF,
    this.hideTag,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorSchemeName = ref.watch(preferencesProvider).colorScheme;
    final colorScheme = AppColors.schemes[colorSchemeName]!;
    return Card(
      color: colorScheme["neutral2"],
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
                    child: hideTag != null
                        ? const Text("")
                        : Icon(
                            isTagged ? Icons.star_sharp : Icons.star_outline,
                            color: colorScheme["text"],
                          ),
                  ),
                  SvgPicture.asset(
                    icon,
                    width: 60,
                    height: 60,
                    color: colorScheme["text"],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      name,
                      style: TextStyle(
                        color: colorScheme["text"],
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
