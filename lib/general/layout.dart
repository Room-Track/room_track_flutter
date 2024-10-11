import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:room_track_flutter/colors.dart';
import 'package:room_track_flutter/general/config/layout.dart';
import 'package:room_track_flutter/general/home/page.dart';
import 'package:room_track_flutter/general/map/page.dart';
import 'package:room_track_flutter/models/preferences.dart';

class HomeLayout extends ConsumerStatefulWidget {
  const HomeLayout({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeLayout();
}

class _HomeLayout extends ConsumerState<ConsumerStatefulWidget> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    final colorSchemeName = ref.watch(preferencesProvider).colorScheme;
    final colorScheme = AppColors.schemes[colorSchemeName]!;
    return Scaffold(
      backgroundColor: colorScheme["back"],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: colorScheme["neutral2"],
          indicatorColor: colorScheme["secondaryLight"],
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
            (Set<WidgetState> states) => TextStyle(color: colorScheme["text"]),
          ),
        ),
        child: NavigationBar(
            height: 110,
            selectedIndex: index,
            onDestinationSelected: (int idx) => {
                  setState(() {
                    index = idx;
                  })
                },
            destinations: <NavigationDestination>[
              NavigationDestination(
                  icon: SvgPicture.asset(
                    "assets/config.svg",
                    color: colorScheme["text"],
                  ),
                  label: "Config"),
              NavigationDestination(
                  icon: SvgPicture.asset("assets/home.svg",
                      color: colorScheme["text"]),
                  label: "Home"),
              NavigationDestination(
                  icon: SvgPicture.asset("assets/map.svg",
                      color: colorScheme["text"]),
                  label: "Map"),
            ]),
      ),
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
