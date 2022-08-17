import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class IMTModel{
  late TextEditingController berat;
  late TextEditingController tinggi;

  IMTModel({required this.berat, required this.tinggi});

  Map<String, dynamic> toMap() {
    return {'berat': berat, 'tinggi': tinggi};
  }

  IMTModel.fromMap(Map map):
      berat = map['berat'],
      tinggi = map['tinggi'];
}
