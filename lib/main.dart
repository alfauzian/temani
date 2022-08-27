import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temani/controllers/auth.dart';
import 'package:temani/view/login_pages/login_page.dart';
import 'package:temani/view/mainPage.dart';
import 'package:temani/view/splash_screen/splash_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authC = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return FutureBuilder(
                future: authC.autoLogin(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Obx(
                      () => GetMaterialApp(
                        debugShowCheckedModeBanner: false,
                        home: authC.isAuth.isTrue
                            ? BottomNavBar()
                            : LoginScreen(),
                      ),
                    );
                  }
                  return CircularProgressIndicator();
                });
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
