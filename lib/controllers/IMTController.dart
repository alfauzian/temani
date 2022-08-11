import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:temani/models/IMT.dart';

class IMTController extends GetxController{

  var imt = IMT();
  int berat = IMT().berat;
  int tinggi = IMT().tinggi;
  int usia = IMT().usia;

  TextEditingController _imtController = TextEditingController();

  
}