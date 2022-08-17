import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  var isAuth = false.obs;
  static final box = GetStorage();
  final nama = box.read('dataUser')['nama'];
  final alamat = box.read('dataUser')['alamat'];
  final hari = box.read('dataUser')['hari'];

  void dialogError(String msg) {
    Get.defaultDialog(title: "Terjadi kesalahan", middleText: msg);
  }

  Future<void> autoLogin() async {
    final box = GetStorage();
    if (box.read("dataUser") != null) {
      final data = box.read("dataUser") as Map<String, dynamic>;
      login(data["nama"], data["alamat"], data["hari"], data["usia"],
          data["rememberMe"]);
    }
  }

  void login(String namaUser, String alamatUser, int hariUser, int usiaUser,
      bool rememberMe) async {
    if (namaUser != '' && alamatUser != '' && hariUser != 0 && usiaUser != 0) {
      if (rememberMe) {
        final box = GetStorage();
        box.write('dataUser', {
          "nama": namaUser,
          "alamat": alamatUser,
          "hari": hariUser,
          "usia": usiaUser,
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


  readNama() {
    final box = GetStorage();
    Map data = box.read('dataUser');
    Text("${data['nama']}]");
  }

  readAlamat() {
    final box = GetStorage();
    final data = box.read('dataUser')['nama'];

  }

  void logOut(bool rememberMe) {
    final box = GetStorage();
    if (box.read('dataUser') != null) {
      box.erase();
    }
    dialogError("data telah dihapus");
    isAuth.value = false;
  }
}
