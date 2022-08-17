import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:temani/models/IMT.dart';

class IMTController extends GetxController{

  final box = GetStorage();

  late TextEditingController berat;
  late TextEditingController tinggi;


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

  Map<String, dynamic> toMap() {
    return {'berat': berat, 'tinggi': tinggi};
  }

  IMTController.fromMap(Map map):
        berat = map['berat'],
        tinggi = map['tinggi'];

  void dialogError(String msg) {
    Get.defaultDialog(title: "Terjadi kesalahan", middleText: msg);
  }

  void inputBMI(int beratUser, int tinggiUser) async{
    if(beratUser != 0 && tinggiUser != 0){
      box.write('imtUser', {
        'berat':beratUser,
        'tinggi':tinggiUser
      });

    }else{
      dialogError('Masukan data dengan benar');
    }
  }






}