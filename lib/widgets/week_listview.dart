import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:temani/pages/BMI/mainBMI2.dart';

DateTime _mingguKehamilan = DateTime(dayCount * 7);

bool _isSelected = false;

_selectedMinggu() {

  if(_isSelected == true) {

  }
}

class WeekListView extends StatefulWidget {
  const WeekListView({Key? key}) : super(key: key);

  @override
  State<WeekListView> createState() => _WeekListViewState();
}

class _WeekListViewState extends State<WeekListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          color: Color(0xffFBC5C5),
          width: 100,
          height: 10,
          child: Card( 
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 3,
            color: _isSelected == true ? Color(0xffFBA1A1) : Color(0xffFBC5C5),
            key: ValueKey(index),
            child: Center(
              child: Text(
                " Minggu $index",
                style: GoogleFonts.lato(
                    textStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Colors.white)),
              ),
            ),
          ),
        );
      },
      itemCount: 45,
    ));
  }
}
