import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GiziCard extends StatefulWidget {
  final int id;
  final int karbohidrat;
  final int protein;
  final int lemak;

  GiziCard(
      {required this.id,
      required this.karbohidrat,
      required this.protein,
      required this.lemak,
      Key? key})
      : super(key: key);

  @override
  State<GiziCard> createState() => _GiziCardState();
}

class _GiziCardState extends State<GiziCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: Card(
        color: Colors.black45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.karbohidrat.toString(),
                  style: _cardTextStyle(),
                )
              ],
            )),
            Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.protein.toString(),
                  style: _cardTextStyle(),
                )
              ],
            )),
            Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.lemak.toString(),
                  style: _cardTextStyle(),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}

TextStyle _cardTextStyle() {
  return GoogleFonts.lato(
      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500));
}
