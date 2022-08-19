import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:temani/controllers/InfoController.dart';
import 'package:temani/controllers/auth.dart';
import 'package:temani/view/mainPage.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginC = Get.put(InfoController());
    final authC = Get.put(AuthController());
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
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        autocorrect: false,
                        controller: loginC.nama,
                        decoration: InputDecoration(
                            hintText: 'Nama', border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        autocorrect: false,
                        controller: loginC.alamat,
                        decoration: InputDecoration(
                            hintText: 'Alamat', border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Obx(() => CheckboxListTile(
                          title: Text('Simpan data'),
                          value: loginC.rememberMe.value,
                          onChanged: (value) => loginC.rememberMe.toggle())),
                      SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {
                              authC.login(
                                  loginC.nama.text,
                                  loginC.alamat.text,
                                  loginC.rememberMe.value);
                            },
                            child: Text('Lanjutkan')),
                      ),
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
