
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:temani/controllers/auth.dart';
import 'package:temani/view/login_pages/login_page.dart';
import 'package:get/get.dart';
import 'package:temani/view/mainPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:
          Center(child: Image.asset('assets/images/logo_login.png')),

    );
  }
}
