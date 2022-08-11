import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temani/controllers/InfoController.dart';
import 'package:temani/view/mainPage.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final loginController = Get.put(InfoController());
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Center(
                        child: Image.asset('assets/images/logo_login.png')),
                  )),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      TextField(
                        autocorrect: false,
                        decoration: InputDecoration(
                            hintText: 'Nama', border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 20,),
                      TextField(
                        autocorrect: false,
                        decoration: InputDecoration(
                            hintText: 'Alamat', border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: TextField(
                              autocorrect: false,
                              decoration: InputDecoration(
                                  hintText: 'Hari kehamilan',
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          SizedBox(width: 20,),
                          Expanded(
                            child: TextField(
                              autocorrect: false,
                              decoration: InputDecoration(
                                  hintText: 'Usia ',
                                  border: OutlineInputBorder()),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () => Get.off(BottomNavBar()), 
                          child: Text('Lanjutkan')),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
