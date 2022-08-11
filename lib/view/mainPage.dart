import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:temani/view/chatPage/sapaScreen.dart';
import 'package:temani/view/giziscreen/giziScreen.dart';
import 'package:temani/view/homescreen/homepage.dart';
import 'package:temani/view/imt_screen/BMIScreen.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;


  static final List<Widget> _NavScreen = <Widget>[
    Dashboarda(),
    BMISCREEN(),
    GiziScreen(),
    ChatPage()
    
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _NavScreen.elementAt(_selectedIndex)),
      bottomNavigationBar: 
      SafeArea(
          child: Container(
            child: GNav(
               tabBackgroundColor: Colors.purple.withOpacity(0.4),
               tabBorderRadius: 15,
              hoverColor: Colors.white,
              gap: 8,
              iconSize: 18,
              activeColor: Colors.white,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              selectedIndex: _selectedIndex,
              tabs: [
              GButton(icon: LineIcons.home , text: "Utama",),
              GButton(icon: LineIcons.balanceScale , text: "IMT",),
              GButton(icon: LineIcons.nutritionix , text: "Gizi",),
              GButton(icon: LineIcons.user , text: "Sapa Bidan",),
            ]),
          ),
        ),
    );
  }
}
