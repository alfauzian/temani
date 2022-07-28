import 'package:flutter/material.dart';
import 'package:temani/pages/mainPage.dart';
import 'dart:async';
import 'package:temani/database/gizi_db.dart';

void main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  
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
          body: MainScreen(),
        ));
  }
}