import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temani/logic/BMI.dart';
import 'package:temani/pages/homepage/dashboard2.dart';
import 'dart:async';
import 'package:temani/database/gizi_db.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ChangeNotifierProvider(
    create: (_) {
      BMI();
    },
    child: MyApp(),
  ));
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
        Duration(seconds: 2),
        (() => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: ((context) => Dashboarda())))));
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
    return MaterialApp(
        theme: ThemeData(
          fontFamily: 'Open-Sans',
        ),
        debugShowCheckedModeBanner: false,
        home: const Scaffold(
          resizeToAvoidBottomInset: false,
          body: SplashScreen(),
        ));
  }
}
