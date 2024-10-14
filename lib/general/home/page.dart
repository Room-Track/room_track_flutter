import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:room_track_flutter/colors.dart';
import 'package:room_track_flutter/elevations.dart';
import 'package:room_track_flutter/general/home/cardRoom.dart';
import 'package:room_track_flutter/general/home/search/page.dart';
import 'package:room_track_flutter/general/home/tagged/lazyTagged.dart';
import 'package:room_track_flutter/models/cards.dart';
import 'package:room_track_flutter/models/preferences.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePage();
}

class _HomePage extends ConsumerState<ConsumerStatefulWidget> {
  final user = FirebaseAuth.instance.currentUser!;

  String getUserName(String email) {
    return email.substring(0, email.indexOf("@"));
  }

  void goToSearchPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SearchPage()));
  }

  @override
  Widget build(BuildContext context) {
    final colorSchemeName = ref.watch(preferencesProvider).colorScheme;
    final colorScheme = AppColors.schemes[colorSchemeName]!;
    final history = ref.watch(cardProvider).historyCards;
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
                  goToSearchPage(context);
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
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Tagged",
              style: TextStyle(
                fontSize: 32,
                color: colorScheme['text'],
              ),
            ),
          ),
          const LazyTaggeds(limit: 3),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "History",
              style: TextStyle(
                fontSize: 32,
                color: colorScheme['text'],
              ),
            ),
          ),
          SizedBox(
            height: 400,
            child: Align(
              alignment: Alignment.topCenter,
              child: (history.isEmpty
                  ? const Center(child: Text("Try searching for rooms.."))
                  : Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        ...history.reversed.map((card) {
                          return Cardroom(
                            name: card.name,
                            isTagged: card.isTagged,
                            icon: card.icon,
                            hideTag: true,
                            onTapF: () {
                              goToInfoPage(context, ref, card);
                            },
                          );
                        })
                      ],
                    )),
            ),
          ),
        ],
      ),
    );
  }
}
