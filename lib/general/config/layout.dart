import 'package:flutter/material.dart';
import 'package:room_track_flutter/general/config/6_contact/page.dart';
import 'package:room_track_flutter/general/config/page.dart';
import 'package:room_track_flutter/general/config/0_profile/page.dart';
import 'package:room_track_flutter/general/config/1_language/page.dart';
import 'package:room_track_flutter/general/config/2_font/page.dart';
import 'package:room_track_flutter/general/config/3_theme/page.dart';
import 'package:room_track_flutter/general/config/4_usage/page.dart';
import 'package:room_track_flutter/general/config/5_share/page.dart';
import 'package:room_track_flutter/general/config/7_version/page.dart';

class SettingsLayout extends StatefulWidget {
  const SettingsLayout({super.key});

  @override
  State<StatefulWidget> createState() => _SettingsLayout();
}

class _SettingsLayout extends State<SettingsLayout> {
  GlobalKey<NavigatorState> settingsLayoutKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: settingsLayoutKey,
      onGenerateRoute: (RouteSettings settings) => MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) {
          switch (settings.name) {
            case '/profile':
              return ProfilePage();
            case '/language':
              return const LanguagePage();
            case '/font':
              return const FontPage();
            case '/theme':
              return const ThemePage();
            case '/usage':
              return const UsagePage();
            case '/share':
              return const SharePage();
            case '/contact':
              return const ContactPage();
            case '/version':
              return const VersionPage();
            default:
              return const SettingsPage();
          }
        },
      ),
    );
  }
}
