import 'package:flutter/material.dart';
import 'package:room_track_flutter/colors.dart';
import 'package:room_track_flutter/general/config/layout.dart';
import 'package:room_track_flutter/general/home/page.dart';
import 'package:room_track_flutter/general/map/page.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});
  @override
  State<StatefulWidget> createState() => _HomeLayout();
}

class _HomeLayout extends State<HomeLayout> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      bottomNavigationBar: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (int idx) => {
                setState(() {
                  index = idx;
                })
              },
          indicatorColor: AppColors.lightBlue90,
          destinations: const <NavigationDestination>[
            NavigationDestination(icon: Icon(Icons.favorite), label: "Config"),
            NavigationDestination(icon: Icon(Icons.favorite), label: "Home"),
            NavigationDestination(icon: Icon(Icons.favorite), label: "Map"),
          ]),
      body: IndexedStack(
        index: index,
        children: [
          const SettingsLayout(),
          HomePage(),
          const MapPage(),
        ],
      ),
    );
  }
}
