import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:room_track_flutter/colors.dart';
import 'package:room_track_flutter/general/home/cardRoom.dart';
import 'package:room_track_flutter/models/cards.dart';
import 'package:room_track_flutter/models/preferences.dart';

class Taggedgrid extends ConsumerWidget {
  final List<CardInfo> tagged;
  const Taggedgrid({
    super.key,
    required this.tagged,
  });

  void onTap() {
    print("Button pressed!");
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorSchemeName = ref.watch(preferencesProvider).colorScheme;
    final colorScheme = AppColors.schemes[colorSchemeName]!;
    return SizedBox(
      height: 450,
      child: Align(
        alignment: Alignment.topCenter,
        child: Wrap(
          alignment: WrapAlignment.start,
          spacing: 10,
          runSpacing: 10,
          children: [
            ...tagged.map((card) {
              return Cardroom(
                name: card.name,
                isTagged: card.isTagged,
                icon: card.icon,
                onTapF: onTap,
              );
            }),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(
                  color: colorScheme["neutral2"]!,
                  width: 2.0,
                ),
              ),
              color: colorScheme["back"],
              clipBehavior: Clip.hardEdge,
              elevation: 0,
              child: InkWell(
                  onTap: () {
                    // TODO mostrar todos los taggeds
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                        width: 190,
                        height: 140,
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/arrow_forward.svg",
                            width: 30,
                            height: 30,
                            color: colorScheme["text"],
                          ),
                        )),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
