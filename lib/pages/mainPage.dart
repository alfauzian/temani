import 'package:flutter/material.dart';
import 'package:temani/pages/Gizi/mainGizi.dart';
import 'package:temani/pages/chatPage/chatPage.dart';
import 'package:temani/pages/homepage/dashboard1.dart';

Color _bottomnavColor = Color(0xffFFCFCF);

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List _pages = [dashBoard(), GiziScreen(), chatPage()];

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _pages[currentIndex],
      bottomNavigationBar: SafeArea(
        child: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: _bottomnavColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.redAccent,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        showUnselectedLabels: false,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm), label: "Dashboard"),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm), label: "BMI"),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm), label: "Gizi"),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm), label: "Sapa"),
        ],
      )),
    );
  }
}
