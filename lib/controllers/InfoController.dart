import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:temani/controllers/auth.dart';

class InfoController extends GetxController {
  static final authC = Get.put(AuthController());

  static final box = GetStorage();

  var rememberMe = false.obs;

  static int readHari = box.read('hari') ?? 1;

  late Timer _timer;

  void StartTimer() {
    int _hari = functionHari();
    //Waktu akan bertambah dalam kurun waktu 1 hari
    //Jika hari = 0, maka timer ini akan diberhentikan
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_hari > 0) {
        _hari++;
        update();
      } else if (readHari != 0) {
        _timer.cancel();
      }
    });
  }

  @override
  late TextEditingController nama;
  late TextEditingController alamat;
  late TextEditingController hari;
  late TextEditingController usia;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    nama = TextEditingController();
    alamat = TextEditingController();
    hari = TextEditingController();
    usia = TextEditingController();
    final box = GetStorage();
    if (box.read('dataUser') != null) {
      final data = box.read('dataUser') as Map<String, dynamic>;
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    nama.dispose();
    alamat.dispose();
    hari.dispose();
    usia.dispose();
  }

  sisaHari() {
    int sisa = 280;
    return sisa - functionHari();
  }

  statusMinggu() {
    final _minggu = (int.parse(hari.text) / 7).toInt();
    return _minggu;
  }

  int functionHari() {
    final statusHari = int.parse(hari.text);
    return statusHari;
  }

  funcTrimester() {
    late int Trimester = 1;
    if (statusMinggu() <= 12) {
      return Trimester = 1;
    } else if (statusMinggu() >= 13 && statusMinggu() < 24) {
      return Trimester = 2;
    } else if (statusMinggu() >= 25) {
      return Trimester = 3;
    }
  }

  Text ukuranBerat() {
    if (statusMinggu() <= 7) {
      return Text('< 1 g');
    } else if (statusMinggu() == 8) {
      return Text('1 g');
    } else if (statusMinggu() == 9) {
      return Text('2 g');
    } else if (statusMinggu() == 10) {
      return Text('4 g');
    } else if (statusMinggu() == 11) {
      return Text('7 g');
    } else if (statusMinggu() == 12) {
      return Text('14 g');
    } else if (statusMinggu() == 13) {
      return Text('23 g');
    } else if (statusMinggu() == 14) {
      return Text('43 g');
    } else if (statusMinggu() == 15) {
      return Text('70 g');
    } else if (statusMinggu() == 16) {
      return Text('100 g');
    } else if (statusMinggu() == 17) {
      return Text('140 g');
    } else if (statusMinggu() == 18) {
      return Text('190 g');
    } else if (statusMinggu() == 19) {
      return Text('240 g');
    } else if (statusMinggu() == 20) {
      return Text('300 g');
    } else if (statusMinggu() == 21) {
      return Text('360 g');
    } else if (statusMinggu() == 22) {
      return Text('430 g');
    } else if (statusMinggu() == 23) {
      return Text('501 g');
    } else if (statusMinggu() == 24) {
      return Text('600 g');
    } else if (statusMinggu() == 25) {
      return Text('660 g');
    } else if (statusMinggu() == 26) {
      return Text('760 g');
    } else if (statusMinggu() == 27) {
      return Text('875 g');
    } else if (statusMinggu() == 28) {
      return Text('1005 g');
    } else if (statusMinggu() == 29) {
      return Text('1153 g');
    } else if (statusMinggu() == 30) {
      return Text('1319 g');
    } else if (statusMinggu() == 31) {
      return Text('1502 g');
    } else if (statusMinggu() == 32) {
      return Text('1702 g');
    } else if (statusMinggu() == 33) {
      return Text('1918 g');
    } else if (statusMinggu() == 34) {
      return Text('2146 g');
    } else if (statusMinggu() == 35) {
      return Text('2386 g');
    } else if (statusMinggu() == 36) {
      return Text('2622 g');
    } else if (statusMinggu() == 37) {
      return Text('2859 g');
    } else if (statusMinggu() == 38) {
      return Text('3083 g');
    } else if (statusMinggu() == 39) {
      return Text('3288 g');
    } else if (statusMinggu() == 40) {
      return Text('3462 g');
    } else if (statusMinggu() == 41) {
      return Text('3597 g');
    } else if (statusMinggu() == 42) {
      return Text('3685 g');
    } else if (statusMinggu() == 43) {
      return Text('> 4000 g');
    } else {
      return Text(' ');
    }
  }

  Text ukuranPanjang() {
    if (statusMinggu() <= 4) {
      return Text('< 0.1 cm');
    } else if (statusMinggu() <= 5) {
      return Text('0.12cm');
    } else if (statusMinggu() == 6) {
      return Text('0.3cm');
    } else if (statusMinggu() == 7) {
      return Text('1.27 cm');
    } else if (statusMinggu() == 8) {
      return Text('1.6 cm');
    } else if (statusMinggu() == 9) {
      return Text('2.3 cm');
    } else if (statusMinggu() == 9) {
      return Text('3.1 cm');
    } else if (statusMinggu() == 10) {
      return Text('3.1 cm');
    } else if (statusMinggu() == 11) {
      return Text('4.1 cm');
    } else if (statusMinggu() == 12) {
      return Text('5.4 cm');
    } else if (statusMinggu() == 13) {
      return Text('7.4 cm');
    } else if (statusMinggu() == 14) {
      return Text('8.7 cm');
    } else if (statusMinggu() == 15) {
      return Text('10.1 cm');
    } else if (statusMinggu() == 16) {
      return Text('11.6 cm');
    } else if (statusMinggu() == 17) {
      return Text('13 cm');
    } else if (statusMinggu() == 18) {
      return Text('14.2 cm');
    } else if (statusMinggu() == 19) {
      return Text('15.3 cm');
    } else if (statusMinggu() == 20) {
      return Text('16.4 cm');
    } else if (statusMinggu() == 21) {
      return Text('26.7 cm');
    } else if (statusMinggu() == 22) {
      return Text('27.8 cm');
    } else if (statusMinggu() == 23) {
      return Text('28.9 cm');
    } else if (statusMinggu() == 24) {
      return Text('30 cm');
    } else if (statusMinggu() == 25) {
      return Text('34.6 cm');
    } else if (statusMinggu() == 26) {
      return Text('35.6 cm');
    } else if (statusMinggu() == 27) {
      return Text('37.6 cm');
    } else if (statusMinggu() == 28) {
      return Text('38.6 cm');
    } else if (statusMinggu() == 29) {
      return Text('39.9 cm');
    } else if (statusMinggu() == 30) {
      return Text('39.9 cm');
    } else if (statusMinggu() == 31) {
      return Text('41.1 cm');
    } else if (statusMinggu() == 32) {
      return Text('42.2 cm');
    } else if (statusMinggu() == 33) {
      return Text('43.7 cm');
    } else if (statusMinggu() == 34) {
      return Text('45 cm');
    } else if (statusMinggu() == 35) {
      return Text('46.2 cm');
    } else if (statusMinggu() == 36) {
      return Text('47.4 cm');
    } else if (statusMinggu() == 37) {
      return Text('48.6 cm');
    } else if (statusMinggu() == 38) {
      return Text('49.8 cm');
    } else if (statusMinggu() == 39) {
      return Text('50.7 cm');
    } else if (statusMinggu() == 40) {
      return Text('51,2cm');
    } else if (statusMinggu() == 41) {
      return Text('51.7 cm');
    } else if (statusMinggu() == 42) {
      return Text('52.5 cm');
    } else if (statusMinggu() == 43) {
      return Text('> 4000 cm');
    } else {
      return Text(' ');
    }
  }

  gambarKehamilan() {
    if (statusMinggu() <= 4) {
      return Image.asset('assets/images/Buah_kandungan_4.png');
    } else if (statusMinggu() > 4 && statusMinggu() <= 7) {
      return Image.asset('assets/images/Buah_kandungan_7.png');
    } else if (statusMinggu() > 7 && statusMinggu() <= 9) {
      return Image.asset('assets/images/Buah_kandungan_9.png');
    } else if (statusMinggu() > 9 && statusMinggu() <= 11) {
      return Image.asset('assets/images/Buah_kandungan_11.png');
    } else if (statusMinggu() >= 12 && statusMinggu() <= 14) {
      return Image.asset('assets/images/Buah_kandungan_14.png');
    } else if (statusMinggu() > 15 && statusMinggu() <= 16) {
      return Image.asset('assets/images/Buah_kandungan_16.png');
    } else if (statusMinggu() > 17 && statusMinggu() <= 18) {
      return Image.asset('assets/images/Buah_kandungan_17.png');
    } else if (statusMinggu() > 19 && statusMinggu() <= 20) {
      return Image.asset('assets/images/Buah_kandungan_18.png');
    } else if (statusMinggu() > 21 && statusMinggu() <= 22) {
      return Image.asset('assets/images/Buah_kandungan_20.png');
    } else if (statusMinggu() > 23 && statusMinggu() <= 24) {
      return Image.asset('assets/images/Buah_kandungan_23.png');
    } else if (statusMinggu() > 25 && statusMinggu() <= 27) {
      return Image.asset('assets/images/Buah_kandungan_26.png');
    } else if (statusMinggu() > 28 && statusMinggu() <= 32) {
      return Image.asset('assets/images/Buah_kandungan_28.png');
    } else if (statusMinggu() > 33 && statusMinggu() <= 34) {
      return Image.asset('assets/images/Buah_kandungan_32.png');
    } else if (statusMinggu() > 35 && statusMinggu() <= 36) {
      return Image.asset('assets/images/Buah_kandungan_33.png');
    } else if (statusMinggu() > 37 && statusMinggu() <= 38) {
      return Image.asset('assets/images/Buah_kandungan_35.png');
    } else if (statusMinggu() > 39 && statusMinggu() < 40) {
      return Image.asset('assets/images/Buah_kandungan_39.png');
    } else {
      Text('!');
    }
  }
}
