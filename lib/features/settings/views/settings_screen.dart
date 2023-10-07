import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodtree/features/auth/repos/auth_repository.dart';
import 'package:moodtree/theme.dart';
import 'package:moodtree/constants/sizes.dart';
import 'package:moodtree/common/widgets/appbar_title.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const AppBarTitle(),
      ),
      body: Column(
        children: [
          SwitchListTile(
            tileColor: ColorThemes.white,
            value: false,
            onChanged: (value) => !value,
            contentPadding: const EdgeInsets.only(
              top: 0,
              bottom: 0,
              left: Sizes.size24,
              right: Sizes.size12,
            ),
            title: const Text(
              "다크모드",
              style: TextStyle(
                fontSize: Sizes.size16,
                color: ColorThemes.darkgray,
              ),
            ),
          ),
          const ListTile(
            tileColor: ColorThemes.white,
            contentPadding: EdgeInsets.only(
              top: 0,
              bottom: 0,
              left: Sizes.size24,
              right: Sizes.size24,
            ),
            title: Text(
              "언어설정",
              style: TextStyle(
                fontSize: Sizes.size16,
                color: ColorThemes.darkgray,
              ),
            ),
            trailing: Text(
              "한국어",
              style: TextStyle(
                fontSize: Sizes.size14,
              ),
            ),
          ),
          ListTile(
            tileColor: ColorThemes.white,
            contentPadding: const EdgeInsets.only(
              top: 0,
              bottom: 0,
              left: Sizes.size24,
              right: Sizes.size24,
            ),
            title: const Text(
              "로그아웃",
              style: TextStyle(
                fontSize: Sizes.size16,
                color: ColorThemes.darkgray,
              ),
            ),
            trailing: GestureDetector(
                onTap: () {
                  ref.read(authRepositoryProvider).signOut();
                },
                child: const Icon(
                  Icons.logout,
                )),
          ),
        ],
      ),
    );
  }
}
