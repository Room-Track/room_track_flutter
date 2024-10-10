import 'package:flutter/material.dart';
import 'package:room_track_flutter/elevations.dart';

class Cardskeleton extends StatelessWidget {
  final Color neutral2;
  final Color secondaryLight;
  const Cardskeleton({
    super.key,
    required this.neutral2,
    required this.secondaryLight,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: neutral2,
      clipBehavior: Clip.hardEdge,
      elevation: AppElevations.m2,
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
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      color: secondaryLight.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    color: secondaryLight.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                      color: secondaryLight.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10)),
                  width: 100,
                  height: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
