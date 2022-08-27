import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:math' as math;

class IMTController extends GetxController{

  static final box = GetStorage();

  late TextEditingController berat;
  late TextEditingController tinggi;

  static double? _berat = box.read('imt')?['berat'] ?? 1;
  static double? _tinggi = box.read('imt')?['tinggi'] ?? 1;

  static double bmi = 0;
  
  calculateIMT() {
    double imtBerat = double.parse(berat.text);
    double imtTinggi = double.parse(tinggi.text);
    bmi = imtBerat / math.pow(imtTinggi / 100, 2);
  }

  statusBMI() {
    if(bmi < 19.8) {
      return 'Kurang';
    }
    else if( bmi >= 19.8 && bmi <= 26.0 ) {
      return 'Normal';
    }
    else if(bmi >= 26.0 && bmi <= 29.0) {
      return 'Tinggi';
    }
    else if(bmi > 29.0) {
      return 'Obesitas';
    }
  }

  statusGambarBMI() {
    if(bmi < 19.8) {
      return Image.asset('assets/images/Kurang_emoticon.png');
    }
    else if( bmi >= 19.8 && bmi <= 26.0 ) {
      return Image.asset('assets/images/Ideal_emoticon.png');
    }
    else if(bmi >= 26.0 && bmi <= 29.0) {
      return Image.asset('assets/images/Normal_emoticon.png');
    }
    else if(bmi > 29.0) {
      return Image.asset('assets/images/Kurang_emoticon.png');
    }
  }





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

  void inputBMI(double beratUser, double tinggiUser) async{
    if(beratUser != 0 && tinggiUser != 0){
      box.write('imt', {
        'berat':beratUser,
        'tinggi':tinggiUser
      });


    }else{
      dialogError('Masukan data dengan benar');
    }
  }
}