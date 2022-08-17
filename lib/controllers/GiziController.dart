import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:temani/controllers/InfoController.dart';
import 'package:temani/models/infoKehamilan.dart';
import 'package:temani/models/gizi.dart';
import 'package:temani/database/gizi_database.dart';

class GiziController extends GetxController {
  var gizi = GiziModel();

  RxInt karbohidrat = GiziModel().karbohidrat;
  RxInt lemak = GiziModel().lemak;
  RxInt protein = GiziModel().protein;

  int? Trimester = InfoController().Trimester;

  late num kalori = (karbohidrat * 9) + (protein * 5) + (lemak * 3);

  late int sisaAsupan;

  var giziData = <GiziModelToDB>[].obs;

  late TextEditingController _addTextEditingController;

  @override
  void onInit() {
    _addTextEditingController = TextEditingController();
    _getGiziData();
    super.onInit();
  }

  void _getGiziData() {
    GiziDatabase.instances.readAllData().then((value) {
      value.forEach((element) {
        giziData.add(GiziModelToDB(
            id: element.id,
            karbohidrat: element.karbohidrat,
            protein: element.protein,
            lemak: element.lemak));
      });
    });
  }

  void _addGizi() async {
    await GiziDatabase.instances.create(GiziModelToDB(
        karbohidrat: _addTextEditingController.text.length,
        protein: _addTextEditingController.text.length,
        lemak: _addTextEditingController.text.length));
    _addTextEditingController.clear();
  }



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
}
