import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle __textStyle() {
  return GoogleFonts.lato(
      textStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 16));
}

class BMI with ChangeNotifier {
  late int usia = 0;
  late int berat = 0;
  late int _tinggi = 0;
  int get tinggi => _tinggi;

  late double hasil = berat / pow(tinggi, 2);

  StreamController _beratController = StreamController();
  Stream get beratStream => _beratController.stream;

  StreamController _tinggiController = StreamController();
  Stream get tinggiStream => _tinggiController.stream;

  StreamController _usiaController = StreamController();
  Stream get usiaStream => _usiaController.stream;

 
  void changeUsiaPlus() {
    usia++;
    notifyListeners();
  }

  void changeUsiaMin() {
    usia--;
    notifyListeners();
  }

  void changeBeratPlus() {
    this._beratController.sink.add(berat++);
    notifyListeners();
  }

  void changeBeratMin() {
    berat--;
    notifyListeners();
  }

  void changeTinggiPlus() {
    _tinggi++;
    notifyListeners();
  }

  void changeTinggiMin() {
    _tinggi--;
    notifyListeners();


  void dispose() {
    
  }
  }

  status() {
    if (hasil < 18) {
      return Text(
        'Kurang',
        style: __textStyle(),
      );
    } else if (hasil == 18 && hasil <= 20) {
      return Text(
        'Normal',
        style: __textStyle(),
      );
    } else if (hasil == 21 && hasil <= 25) {
      return Text(
        'Bagus',
        style: __textStyle(),
      );
    } else if (hasil == 26 && hasil <= 31) {
      return Text(
        'Obesitas',
        style: __textStyle(),
      );
    } else {
      return Text(
        'G Tau',
        style: __textStyle(),
      );
    }
  }

  statusGambar(BuildContext context) {
    if (hasil < 18) {
      return Image.asset('assets/images/Kurang_emoticon.png');
    } else if (hasil == 18 && hasil <= 22) {
      return Image.asset('assets/images/Normal_emoticon.png');
    } else if (hasil == 23 && hasil <= 25) {
      return Image.asset('assets/images/Ideal_emoticon.png');
    } else if (hasil == 26 && hasil <= 31 && hasil > 32) {
      return Image.asset('assets/images/Kurang_emoticon.png');
    } else {
      return Image.asset('assets/images/Kurang_emoticon.png');
    }
  }

  tipsStatus() {
    if (hasil < 18) {
      return Text('Hasil IMT kehamilan anda kurang dari rata - rata normal');
    } else if (hasil == 18 && hasil <= 22) {
      return Text('hasil BMI kehaimaln anda dalam keadaan normal');
    } else if (hasil == 23 && hasil <= 25) {
      return Text('Bagus! Anda mempunyai jumlah IMT yang ideal !');
    } else if (hasil == 26 && hasil <= 31) {
      return Text('Anda memiliki IMT yang berlebih !');}
      else if (hasil > 32) {
      return Text('Anda memiliki IMT yang berlebih !');
    } else {
      return Text('Anda Belum memasukan data');
    }
  }
  saranStatus() {
     if (hasil < 18) {
      return Text('Tambah asupan gizi harian anda setiap hari');
    } else if (hasil == 18 && hasil <= 22) {
      return Text('Anda dalam keadaan normal, jaga asupan gizi anda');
    } else if (hasil == 23 && hasil <= 25) {
      return Text('Anda dalam keadaan idea, tetap pertahankan ya !');
    } else if (hasil == 26 && hasil <= 31) {
      return Text('kontrol asupan gizi anda !');
    }
    else if (hasil > 32) {
      return Text('Kontrol berat dan tinggi badan anda !');}
     else {
      return Text('Anda Belum memasukan data');
   }
  }
}

class MainInti with ChangeNotifier {}
