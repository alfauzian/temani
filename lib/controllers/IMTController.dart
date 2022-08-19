import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:temani/models/IMT.dart';

class IMTController extends GetxController{

  static final imt = GetStorage();

  late TextEditingController berat;
  late TextEditingController tinggi;

  static final beratC = imt.read('imtUser')['berat'];
  static final tinggiC = imt.read('imtUser')['tinggi'];


  @override
  void onInit() async{
    super.onInit();
    berat = TextEditingController();
    tinggi = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    berat.dispose();
    tinggi.dispose();
  }



  void dialogError(String msg) {
    Get.defaultDialog(title: "Terjadi kesalahan", middleText: msg);
  }

  void inputBMI(int beratUser, int tinggiUser) async{
    if(beratUser != 0 && tinggiUser != 0){
      imt.write('imtUser', {
        'berat':beratUser,
        'tinggi':tinggiUser
      });

    }else{
      dialogError('Masukan data dengan benar');
    }
  }






}