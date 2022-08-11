import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:temani/view/homescreen/homepage.dart';
import 'package:temani/view/login_pages/login_page.dart';
import 'dart:async';
import 'package:temani/view/mainPage.dart';

import 'logic/BMI.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage().initStorage;
  runApp(MyApp(),);
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3),
        (() => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: ((context) => BottomNavBar())))));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Image.asset('assets/images/logo_login.png')),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'Open-Sans'),
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
        );
  }
}
