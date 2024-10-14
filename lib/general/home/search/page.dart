import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:room_track_flutter/colors.dart';
import 'package:room_track_flutter/general/home/search/lazyList.dart';
import 'package:room_track_flutter/models/preferences.dart';
import 'package:room_track_flutter/models/search.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorSchemeName = ref.watch(preferencesProvider).colorScheme;
    final colorScheme = AppColors.schemes[colorSchemeName]!;
    return Scaffold(
      backgroundColor: colorScheme['back'],
      body: ListView(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(5),
            child: SearchBar(
              onChanged: (String query) {
                ref.read(searchQueryProvider).changeQuery(query);
              },
              autoFocus: true,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: AppColors.black,
                    size: 30,
                  )),
              constraints: const BoxConstraints(minHeight: 65),
              hintText: "Search rooms",
              hintStyle: WidgetStateProperty.resolveWith<TextStyle>(
                (Set<WidgetState> states) =>
                    const TextStyle(color: AppColors.grey),
              ),
              textStyle: WidgetStateProperty.resolveWith<TextStyle>(
                (Set<WidgetState> states) =>
                    const TextStyle(color: AppColors.black),
              ),
              backgroundColor: WidgetStateProperty.resolveWith<Color>(
                  (state) => AppColors.white),
              shape: WidgetStateProperty.resolveWith<RoundedRectangleBorder>(
                (states) => RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
          const LazySearchList(),
        ],
      ),
    );
  }
}
