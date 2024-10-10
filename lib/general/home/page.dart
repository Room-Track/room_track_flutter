import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:room_track_flutter/colors.dart';
import 'package:room_track_flutter/elevations.dart';
import 'package:room_track_flutter/general/home/cardRoom.dart';
import 'package:room_track_flutter/models/preferences.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  String getUserName(String email) {
    return email.substring(0, email.indexOf("@"));
  }

  void onTap() {
    print("Button pressed!");
  }

  List<Cardroom> getTagged() {
    return List.generate(3, (i) {
      return Cardroom(
        name: "M20$i",
        isTagged: true,
        icon: "assets/room.svg",
        onTapF: onTap,
        
      );
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorSchemeName = ref.watch(preferencesProvider).colorScheme;
    final colorScheme = AppColors.schemes[colorSchemeName]!;
    return Scaffold(
      backgroundColor: colorScheme["back"],
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colorScheme["primary"],
                    ),
                    child: Text(
                      getUserName(user.email!),
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        const AssetImage('assets/profile_placeholder.png'),
                    backgroundColor: colorScheme["neutral2"],
                  )
                ],
              )),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.white,
                    elevation: AppElevations.m3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                onPressed: () {
                  // TODO Pasar a pantalla de busqueda
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        "assets/search.svg",
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 15),
                      Text(
                        "Search rooms",
                        style: TextStyle(
                            color: colorScheme["neutral"], fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Tagged Rooms",
              style: TextStyle(
                fontSize: 32,
                color: AppColors.white,
              ),
            ),
          ),
          SizedBox(
            height: 450,
            child: Align(
              alignment: Alignment.topCenter,
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: 10,
                runSpacing: 10,
                children: [
                  ...getTagged(),
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
          ),
        ],
      ),
    );
  }
}
