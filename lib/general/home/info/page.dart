import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:room_track_flutter/colors.dart';
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
      backgroundColor: AppColors.black,
      appBar: AppBar(
          foregroundColor: AppColors.white,
          backgroundColor: AppColors.black,
          title: Text(
            "${info.name} ${info.type}",
            style: const TextStyle(color: AppColors.white),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "General Location",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  children: [
                    TextButton(
                        onPressed: () {
                          // TODO show on google maps
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        child: Container(
                          width: 200,
                          height: 200,
                          color: AppColors.brightBlue,
                          child: const Center(
                            child: Text("Map Image"),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${info.name.substring(0, 1)} Building",
                            style: const TextStyle(
                              fontSize: 20,
                              color: AppColors.white,
                            ),
                          ),
                          const Text(
                            "Inside of USM",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.lightBlue,
                            ),
                          ),
                          const SizedBox(height: 35),
                          const Text(
                            "Level",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.white,
                            ),
                          ),
                          const Text(
                            "2nd Floor",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.lightBlue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                TextButton(
                  onPressed: () {
                    // TODO go to map and indications
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    backgroundColor: AppColors.brightBlue,
                  ),
                  child: const Center(
                    child: Text(
                      "Go",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 15,
              right: 5,
              child: IconButton(
                onPressed: () {
                  // TODO destag the card
                },
                icon: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Icon(
                    info.isTagged ? Icons.star_sharp : Icons.star_outline,
                    size: 35,
                    color: AppColors.lightBlue,
                  ),
                ),
                style: IconButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: AppColors.darkGrey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
