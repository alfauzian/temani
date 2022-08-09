import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temani/logic/BMI.dart';
import 'package:temani/pages/homescreen/homepage.dart';
import 'dart:async';
import 'package:temani/pages/mainPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
            context, MaterialPageRoute(builder: ((context) => MainNavigationBar())))));
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
