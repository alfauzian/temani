import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:temani/controllers/auth.dart';
import 'package:temani/view/login_pages/login_page.dart';
import 'dart:async';
import 'package:temani/view/mainPage.dart';
import 'package:temani/view/splash_screen/splash_screen.dart';

import 'logic/BMI.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp(),
  );
}

class MyApp extends StatelessWidget {
  final authC = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: authC.autoLogin(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Obx(
              () => GetMaterialApp(
                debugShowCheckedModeBanner: false,
                home: authC.isAuth.isTrue ? BottomNavBar() : LoginScreen(),
              ),
            );
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: SplashScreen(),
            ),
          );
        });
  }
}
