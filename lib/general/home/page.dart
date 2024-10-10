import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:room_track_flutter/colors.dart';
import 'package:room_track_flutter/elevations.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  String getUserName(String email) {
    return email.substring(0, email.indexOf("@"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
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
                      color: AppColors.brightBlue,
                    ),
                    child: Text(
                      getUserName(user.email!),
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        AssetImage('assets/profile_placeholder.png'),
                    backgroundColor: AppColors.darkGrey,
                  )
                ],
              )),
          const SizedBox(height: 10),
          SizedBox(
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
                    const Text(
                      "Search rooms",
                      style: TextStyle(color: AppColors.grey, fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
