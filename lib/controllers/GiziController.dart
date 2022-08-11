import 'package:get/get.dart';
import 'package:temani/controllers/InfoController.dart';
import 'package:temani/models/infoKehamilan.dart';

import '../models/gizi.dart';


class GiziController extends GetxController {

  var gizi = GiziModel();

  RxInt karbohidrat = GiziModel().karbohidrat;
  RxInt lemak = GiziModel().lemak;
  RxInt protein = GiziModel().protein;

  int Trimester = InfoController().Trimester;

  late num kalori = (karbohidrat * 9) + (protein * 5) + (lemak * 3);


  late int sisaAsupan ;






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