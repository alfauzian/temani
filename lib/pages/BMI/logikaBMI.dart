
import 'package:flutter/material.dart';
import 'dart:math';
import './mainBMI2.dart';





class Hasil {

  late double hasil;

  double hasiBMI(TextEditingController weightController,
      TextEditingController heightController) {

    double berat = double.parse(weightController.text);
    double tinggi = double.parse(heightController.text);

    hasil = berat / (((tinggi * tinggi) / 10000));
    
    return hasil;

  }




  String? statusBMI() {
  if (hasil < 18) {
    return "Kurang";

  }
  else if(hasil >= 18 && hasil <= 25){
    return "Ideal";
  }
  else if(hasil >= 26 && hasil <= 30) {
    return "Lebih";
  }
  else if(hasil >=31 && hasil <= 39) {
    return "Gemuk";
  }
  else if ( hasil >= 40) {
    return "Obesitas";
  }
  else{
    return null;
  }
  return null;
  }
}

_indicatorColor(statusBMI) {
  if (statusBMI == "Kurang") {
    return Color(0xffEB1D36);
  }
  else if(statusBMI == "Ideal") {
    return Color(0xff7DCE13);
  }
  else if(statusBMI == "Lebih") {
    return Color(0xff76BA99);
  }
  else if(statusBMI == "Gemuk") {
    return Color(0xffFFF80A);
  }
  else if(statusBMI == "Obesitas") {
    return Color(0xffFEB139);
  }
}
