import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:line_icons/line_icons.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:temani/view/giziscreen/giziList.dart';

class GiziScreen extends StatefulWidget {
  const GiziScreen({Key? key}) : super(key: key);

  @override
  State<GiziScreen> createState() => _GiziScreenState();
}

class _GiziScreenState extends State<GiziScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('Tambah gizi'),
        backgroundColor: Color(0xffFFC4C4),
        icon: Icon(Icons.add),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.pink.shade100,
                      border: Border.all(color: Colors.pink.shade100),
                      borderRadius: BorderRadius.circular(20)),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3.3,
                  child: Row(children: [
                    Expanded(
                      child: CircularPercentIndicator(
                          animationDuration: 1200,
                          radius: MediaQuery.of(context).size.width / 4.4,
                          lineWidth: MediaQuery.of(context).size.width / 4,
                          animation: true,
                          percent: 1,
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: Colors.white,
                          backgroundColor: Colors.white.withOpacity(0.2),
                          center: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.purple[200],
                                    shape: BoxShape.circle),
                                padding: EdgeInsets.all(10),
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.purple[100]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Sisa asupan",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "960",
                                          style: TextStyle(
                                              fontSize: 23,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Text(
                                        "kcal",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ))),
                      flex: 3,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Karbohidrat",
                                  style: _textInfoStyle(),
                                ),
                                LinearPercentIndicator(
                                  padding: EdgeInsets.only(left: 0, right: 4),
                                  backgroundColor:
                                      Colors.white.withOpacity(0.3),
                                  progressColor: Colors.white,
                                  percent: 0.6,
                                  lineHeight: 10,
                                  barRadius: Radius.circular(12),
                                ),
                                Text(
                                  "230 gram",
                                  style: _textInfoStyle(),
                                )
                              ],
                            )),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Protein",
                                  style: _textInfoStyle(),
                                ),
                                LinearPercentIndicator(
                                  padding: EdgeInsets.only(left: 0, right: 4),
                                  backgroundColor:
                                      Colors.white.withOpacity(0.3),
                                  progressColor: Colors.white,
                                  percent: 0.3,
                                  lineHeight: 10,
                                  barRadius: Radius.circular(12),
                                ),
                                Text(
                                  "120 gram",
                                  style: _textInfoStyle(),
                                )
                              ],
                            )),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Lemak",
                                  style: _textInfoStyle(),
                                ),
                                LinearPercentIndicator(
                                  padding: EdgeInsets.only(left: 0, right: 8),
                                  backgroundColor:
                                      Colors.white.withOpacity(0.3),
                                  progressColor: Colors.white,
                                  percent: 0.7,
                                  barRadius: Radius.circular(12),
                                  lineHeight: 10,
                                ),
                                Text(
                                  "200 gram",
                                  style: _textInfoStyle(),
                                )
                              ],
                            )),
                          ],
                        ),
                      ),
                      flex: 3,
                    ),
                  ]),
                ),
                flex: 3,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    height: MediaQuery.of(context).size.width / 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: double.infinity,
                            decoration: BoxDecoration(
                                color: Color(0xffFCC5C0),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Asupan\n sekarang',
                                  style: _textInfoStyle(),
                                ),
                                Text(
                                  '1240',
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          color: Colors.white, fontSize: 50)),
                                ),
                                Text(
                                  "kcal",
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          color: Colors.white, fontSize: 40)),
                                )
                              ],
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
                flex: 2,
              ),
              Flexible(
                  flex: 4,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          Text(
                            "Daftar gizi saat ini",
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600)),
                          ),
                          Flexible(child: Container())
                        ],
                      )))
            ],
          ),
        ),
      ),
    );
  }
}

TextStyle _textInfoStyle() {
  return GoogleFonts.openSans(
      textStyle: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white));
}

TextStyle _bigTextInfoStyle() {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          color: Color(0xffF9F5EB), fontSize: 30, fontWeight: FontWeight.w500));
}
