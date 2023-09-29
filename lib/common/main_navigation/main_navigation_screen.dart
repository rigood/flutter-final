import 'package:flutter/material.dart';
import 'package:moodtree/constants/gaps.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:moodtree/theme.dart';
import 'package:moodtree/constants/sizes.dart';
import 'package:moodtree/common/main_navigation/widgets/nav_tab.dart';
import 'package:moodtree/features/post/views/home_screen.dart';
import 'package:moodtree/features/settings/views/settings_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  final String tab;

  const MainNavigationScreen({
    super.key,
    required this.tab,
  });

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final List<String> _tabs = [
    "home",
    "calendar",
    "chart",
    "settings",
  ];

  late int _selectedTabIndex = _tabs.indexOf(widget.tab);

  void _onNavTabTap(int tabIndex) {
    setState(() {
      _selectedTabIndex = tabIndex;
    });

    context.go("/${_tabs[tabIndex]}");
  }

  void _onPostButtonPressed() {
    final date = DateFormat("yyyy-MM-dd").format(DateTime.now());
    print("현재 날짜 $date 시각 ${DateTime.now()}");
    context.push("/post/$date");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Offstage(
              offstage: _selectedTabIndex != 0,
              child: const HomeScreen(),
            ),
            Offstage(
              offstage: _selectedTabIndex != 1,
              child: const Placeholder(
                color: ColorThemes.appBackground,
              ),
            ),
            Offstage(
              offstage: _selectedTabIndex != 2,
              child: const Placeholder(
                color: ColorThemes.appBackground,
              ),
            ),
            Offstage(
              offstage: _selectedTabIndex != 3,
              child: const SettingsScreen(),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 20,
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: Padding(
            padding: const EdgeInsets.only(
              top: Sizes.size10,
              bottom: Sizes.size5,
              left: Sizes.size16,
              right: Sizes.size16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavTab(
                  label: "홈",
                  icon: FontAwesomeIcons.houseChimney,
                  isSelected: _selectedTabIndex == 0,
                  onTap: () => _onNavTabTap(0),
                ),
                NavTab(
                  label: "캘린더",
                  icon: FontAwesomeIcons.solidCalendarDays,
                  isSelected: _selectedTabIndex == 1,
                  onTap: () => _onNavTabTap(1),
                ),
                Gaps.h80,
                NavTab(
                  label: "차트",
                  icon: FontAwesomeIcons.chartSimple,
                  isSelected: _selectedTabIndex == 2,
                  onTap: () => _onNavTabTap(2),
                ),
                NavTab(
                  label: "설정",
                  icon: FontAwesomeIcons.gear,
                  isSelected: _selectedTabIndex == 3,
                  onTap: () => _onNavTabTap(3),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _onPostButtonPressed,
          backgroundColor: ColorThemes.primary,
          child: const FaIcon(
            FontAwesomeIcons.featherPointed,
            size: Sizes.size24,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
