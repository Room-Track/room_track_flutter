import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        height: 110,
          selectedIndex: index,
          onDestinationSelected: (int idx) => {
                setState(() {
                  index = idx;
                })
              },
          indicatorColor: AppColors.lightBlue90,
          destinations: <NavigationDestination>[
            NavigationDestination(icon: SvgPicture.asset("assets/config.svg"), label: "Config"),
            NavigationDestination(icon: SvgPicture.asset("assets/home.svg"), label: "Home"),
            NavigationDestination(icon: SvgPicture.asset("assets/map.svg"), label: "Map"),
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
