import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/single_child_widget.dart';

class GambarWithNutrisi with ChangeNotifier {
  late String nama;
  late int hari = 0;
  late int minggu = 5;
  late int Trimester = 1;

  late int karbohidrat = 0;
  late int protein = 0;
  late int lemak = 0;

  late int kalori = (karbohidrat * 9) + (protein * 5) + (protein * 3);

  late int sisaAsupan;

  sisa() {
    if (Trimester == 1) {
      sisaAsupan = 1800;
      return sisaAsupan - kalori;
    } else if (Trimester == 2) {
      sisaAsupan = 2100;
      return sisaAsupan - kalori;
    } else if (Trimester == 3) {
      sisaAsupan = 2400;
      return sisaAsupan - kalori;
    }
  }

  ukuranBerat() {
    if (minggu <= 7) {
      return Text('< 1 cm');
    } else if (minggu == 8) {
      return Text('1 cm');
    } else if (minggu == 9) {
      return Text('2 cm');
    } else if (minggu == 10) {
      return Text('4 cm');
    } else if (minggu == 11) {
      return Text('7 cm');
    } else if (minggu == 12) {
      return Text('14 cm');
    } else if (minggu == 13) {
      return Text('23 cm');
    } else if (minggu == 14) {
      return Text('43 cm');
    } else if (minggu == 15) {
      return Text('70 cm');
    } else if (minggu == 16) {
      return Text('100 cm');
    } else if (minggu == 17) {
      return Text('140 cm');
    } else if (minggu == 18) {
      return Text('190 cm');
    } else if (minggu == 19) {
      return Text('240 cm');
    } else if (minggu == 20) {
      return Text('300 cm');
    } else if (minggu == 21) {
      return Text('360 cm');
    } else if (minggu == 22) {
      return Text('430 cm');
    } else if (minggu == 23) {
      return Text('501 cm');
    } else if (minggu == 24) {
      return Text('600 cm');
    } else if (minggu == 25) {
      return Text('660 cm');
    } else if (minggu == 26) {
      return Text('760 cm');
    } else if (minggu == 27) {
      return Text('875 cm');
    } else if (minggu == 28) {
      return Text('1005 cm');
    } else if (minggu == 29) {
      return Text('1153 cm');
    } else if (minggu == 30) {
      return Text('1319 cm');
    } else if (minggu == 31) {
      return Text('1502 cm');
    } else if (minggu == 32) {
      return Text('1702 cm');
    } else if (minggu == 33) {
      return Text('1918 cm');
    } else if (minggu == 34) {
      return Text('2146 cm');
    } else if (minggu == 35) {
      return Text('2386 cm');
    } else if (minggu == 36) {
      return Text('2622 cm');
    } else if (minggu == 37) {
      return Text('2859 cm');
    } else if (minggu == 38) {
      return Text('3083 cm');
    } else if (minggu == 39) {
      return Text('3288 cm');
    } else if (minggu == 40) {
      return Text('3462 cm');
    } else if (minggu == 41) {
      return Text('3597 cm');
    } else if (minggu == 42) {
      return Text('3685 cm');
    } else if (minggu == 43) {
      return Text('> 4000 cm');
    }
  }

  ukuranPanjang() {
    if (minggu <= 4) {
      return Text('< 0.1 cm');
    } else if (minggu == 5) {
      return Text('0.12cm');
    } else if (minggu == 6) {
      return Text('0.3cm');
    } else if (minggu == 7) {
      return Text('1.27 cm');
    } else if (minggu == 8) {
      return Text('1.6 cm');
    } else if (minggu == 9) {
      return Text('2.3 cm');
    } else if (minggu == 9) {
      return Text('3.1 cm');
    } else if (minggu == 10) {
      return Text('3.1 cm');
    } else if (minggu == 11) {
      return Text('4.1 cm');
    } else if (minggu == 12) {
      return Text('5.4 cm');
    } else if (minggu == 13) {
      return Text('7.4 cm');
    } else if (minggu == 14) {
      return Text('8.7 cm');
    } else if (minggu == 15) {
      return Text('10.1 cm');
    } else if (minggu == 16) {
      return Text('11.6 cm');
    } else if (minggu == 17) {
      return Text('13 cm');
    } else if (minggu == 18) {
      return Text('14.2 cm');
    } else if (minggu == 19) {
      return Text('15.3 cm');
    } else if (minggu == 20) {
      return Text('16.4 cm');
    } else if (minggu == 21) {
      return Text('26.7 cm');
    } else if (minggu == 22) {
      return Text('27.8 cm');
    } else if (minggu == 23) {
      return Text('28.9 cm');
    } else if (minggu == 24) {
      return Text('30 cm');
    } else if (minggu == 25) {
      return Text('34.6 cm');
    } else if (minggu == 26) {
      return Text('35.6 cm');
    } else if (minggu == 27) {
      return Text('37.6 cm');
    } else if (minggu == 28) {
      return Text('38.6 cm');
    } else if (minggu == 29) {
      return Text('39.9 cm');
    } else if (minggu == 30) {
      return Text('39.9 cm');
    } else if (minggu == 31) {
      return Text('41.1 cm');
    } else if (minggu == 32) {
      return Text('42.2 cm');
    } else if (minggu == 33) {
      return Text('43.7 cm');
    } else if (minggu == 34) {
      return Text('45 cm');
    } else if (minggu == 35) {
      return Text('46.2 cm');
    } else if (minggu == 36) {
      return Text('47.4 cm');
    } else if (minggu == 37) {
      return Text('48.6 cm');
    } else if (minggu == 38) {
      return Text('49.8 cm');
    } else if (minggu == 39) {
      return Text('50.7 cm');
    } else if (minggu == 40) {
      return Text('51,2cm');
    } else if (minggu == 41) {
      return Text('51.7 cm');
    } else if (minggu == 42) {
      return Text('52.5 cm');
    } else if (minggu == 43) {
      return Text('> 4000 cm');
    }
    notifyListeners();
  }

  gambarKehamilan() {
    if (minggu <= 4) {
      return Image.asset('assets/images/Buah_kandungan_4.png');
    } else if (minggu > 4 && minggu <= 7) {
      return Image.asset('assets/images/Buah_kandungan_7.png');
    } else if (minggu > 7 && minggu <= 9) {
      return Image.asset('assets/images/Buah_kandungan_9.png');
    } else if (minggu > 9 && minggu <= 11) {
      return Image.asset('assets/images/Buah_kandungan_11.png');
    }
    else if (minggu > 9 && minggu <= 11) {
      return Image.asset('assets/images/Buah_kandungan_11.png');
    }else if (minggu > 9 && minggu <= 11) {
      return Image.asset('assets/images/Buah_kandungan_11.png');
    }else if (minggu > 9 && minggu <= 11) {
      return Image.asset('assets/images/Buah_kandungan_11.png');
    }else if (minggu > 9 && minggu <= 11) {
      return Image.asset('assets/images/Buah_kandungan_11.png');
    }else if (minggu > 9 && minggu <= 11) {
      return Image.asset('assets/images/Buah_kandungan_11.png');
    }else if (minggu > 9 && minggu <= 11) {
      return Image.asset('assets/images/Buah_kandungan_11.png');
    }else if (minggu > 9 && minggu <= 11) {
      return Image.asset('assets/images/Buah_kandungan_11.png');
    }else if (minggu > 9 && minggu <= 11) {
      return Image.asset('assets/images/Buah_kandungan_11.png');
    }else if (minggu > 9 && minggu <= 11) {
      return Image.asset('assets/images/Buah_kandungan_11.png');
    }
  }
}
