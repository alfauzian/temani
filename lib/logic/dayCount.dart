import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';




class Waktu with ChangeNotifier{

  late int day;
  late int minggu;
  late int Trimester;
  late int jumlahKehamilan = 305;
  late int sisa;
  late int sisakehamilan = jumlahKehamilan - sisa;


  DateTime now = DateTime.now();

  
}