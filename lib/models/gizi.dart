import 'package:get/get.dart';

class GiziModel{
  late int karbohidrat = 0.obs as int;
  late int protein = 0.obs as int;
  late int lemak = 0.obs as int;
  late var hasil = ((karbohidrat * 9) + (protein * 5) + (lemak * 3));
}