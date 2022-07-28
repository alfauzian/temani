import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class waktuHamil {
  time() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(now);
    print(formatted);
  }
}
