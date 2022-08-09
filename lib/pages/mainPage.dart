import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:temani/pages/chatPage/sapaScreen.dart';
import 'package:temani/pages/homescreen/homepage.dart';

class MainNavigationBar extends StatefulWidget {
  const MainNavigationBar({Key? key}) : super(key: key);

  @override
  State<MainNavigationBar> createState() => _MainNavigationBarState();
}

class _MainNavigationBarState extends State<MainNavigationBar> {
  List pages = [Dashboarda(), ChatPage()];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[_currentIndex],
        bottomNavigationBar: SalomonBottomBar(
          onTap: (pages) {
            setState(() {
              _currentIndex = pages;
            });
          },
          currentIndex: _currentIndex,
          items: [
            SalomonBottomBarItem(
                icon: FaIcon(FontAwesomeIcons.home),
                title: Text('Layar Utama')),
            SalomonBottomBarItem(
                icon: FaIcon(FontAwesomeIcons.userNurse),
                title: Text('Sapa Bidan'))
          ],
        ));
  }
}
