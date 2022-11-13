import 'package:apkainzynierka/pages/journal_page.dart';
import 'package:apkainzynierka/pages/therapy_page.dart';
import 'package:apkainzynierka/profile/profile_page.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentPageIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentPageIndex = index);
          },
          children: const [TherapyPage(), JournalPage(), ProfilePage()],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(
          currentPageIndex: _currentPageIndex, onItemSelected: _switchPage),
    );
  }

  void _switchPage(int index) {
    setState(() {
      _currentPageIndex = index;
    });
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200),
        curve: Curves.linearToEaseOut);
  }
}

Widget _buildBottomBar(
        {required int currentPageIndex,
        required void Function(int index) onItemSelected}) =>
    BottomNavyBar(
      selectedIndex: currentPageIndex,
      onItemSelected: onItemSelected,
      items: [
        BottomNavyBarItem(
            icon: const Icon(Icons.abc), title: const Text("One")),
        BottomNavyBarItem(
            icon: const Icon(Icons.abc), title: const Text("Two")),
        BottomNavyBarItem(
            icon: const Icon(Icons.abc), title: const Text("Three")),
      ],
    );
