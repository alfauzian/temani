import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  var isAuth = false.obs;
  static final box = GetStorage();



  void dialogError(String msg) {
    Get.defaultDialog(title: "Terjadi kesalahan", middleText: msg);
  }

  Future<void> autoLogin() async {
    final box = GetStorage();
    if (box.read("dataUser") != null) {
      final data = box.read("dataUser") as Map<String, dynamic>;
      login(data["nama"], data["alamat"],
          data["rememberMe"]);
    }
  }

  void login(String namaUser, String alamatUser,
      bool rememberMe) async {
    if (namaUser != '' && alamatUser != '' && rememberMe == true) {
      if (rememberMe) {
        final box = GetStorage();
        box.write('dataUser', {
          "nama": namaUser,
          "alamat": alamatUser,
          "rememberMe": rememberMe
        });
      } else {
        final box = GetStorage();
        if (box.read('dataUser') != null) {
          box.erase();
        }
      }
      isAuth.value = true;
    } else {
      dialogError("Masukan input yang benar");
    }
  }




  void logOut(bool rememberMe) {
    final box = GetStorage();
    if (box.read('dataUser') != null) {
      box.erase();
      box.write('dataUser', {
        'hari': 1
      });
    }
    dialogError("data telah dihapus");
    isAuth.value = false;
  }
}
