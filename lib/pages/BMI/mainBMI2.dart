import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:temani/pages/BMI/bar_chart.dart';
import 'package:temani/pages/BMI/logikaBMI.dart';

Color _widgetColor = Color(0xffFFCFCF);
Color _backgroundColor = Color(0xffFFAEAE);
Color _buttonColor = Color(0xffFF9898);
Color _inputBackgroundColor = Color(0xff9bf7fa);
Color _inputColor = Color(0xff77babd);

class BMIScreen extends StatefulWidget {
  const BMIScreen({Key? key}) : super(key: key);
  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

const dayCount = 7;
int beratBadan = 25;
int tinggiBadan = 160;
int usia = 19;

class _BMIScreenState extends State<BMIScreen> {
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  double bodyMassIndex = 0;
  String _status = "Normal";

  Hasil _hasil = Hasil();

  _dialogTinggiBadan(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Masukan Tinggi Badan'),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(shape: CircleBorder()),
                    onPressed: () {
                      beratBadan--;
                    },
                    child: Icon(Icons.remove)),
                Text('$beratBadan',style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16
                  )
                ),),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: CircleBorder()),
                    onPressed: () {
                      beratBadan++;
                    },
                    child: Icon(Icons.add))
              ],
            ),
          );
        });
  }

  @override
  void dispose() {
    weightController.dispose();
    heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Center(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: BarChartSample3(),
                    flex: 2,
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          Flexible(
                            child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Card(
                                      color: Color(0xffE7F6F2),
                                      child: Column(
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "31",
                                                    style:
                                                        _infoNumberTextstyle(),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'IMT',
                                                        style: _infoTextStyle(),
                                                      ),
                                                      Text("$_status")
                                                    ],
                                                  )
                                                ],
                                              )),
                                          Expanded(child: Placeholder())
                                        ],
                                      )),
                                )),
                            flex: 5,
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Card(
                                color: Color(0xffF1F1F1),
                                child: Row(
                                  children: [
                                    Flexible(
                                      flex: 3,
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        child: Row(
                                          children: [
                                            Flexible(
                                              child: GestureDetector(
                                                  onTap: () =>
                                                      _dialogTinggiBadan(
                                                          context),
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "$beratBadan",
                                                          style:
                                                              _numberTextInfoStyle(),
                                                        ),
                                                        Text("Berat (kg)",
                                                            style:
                                                                _textInfoStyle()),
                                                      ],
                                                    ),
                                                  )),
                                              flex: 1,
                                            ),
                                            Flexible(
                                              child: GestureDetector(
                                                child: Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "$tinggiBadan",
                                                        style:
                                                            _numberTextInfoStyle(),
                                                      ),
                                                      Text("Tinggi (cm)",
                                                          style:
                                                              _textInfoStyle()),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              flex: 1,
                                            ),
                                            Flexible(
                                              child: GestureDetector(
                                                child: Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "$tinggiBadan",
                                                        style:
                                                            _numberTextInfoStyle(),
                                                      ),
                                                      Text("Tinggi (cm)",
                                                          style:
                                                              _textInfoStyle()),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              flex: 1,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            flex: 3,
                          )
                        ],
                      ),
                    ),
                    flex: 2,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

TextStyle _textInfoStyle() {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontWeight: FontWeight.w500, fontSize: 16, color: Colors.grey[500]));
}

TextStyle _numberTextInfoStyle() {
  return GoogleFonts.lato(
      textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 28));
}

TextStyle _infoNumberTextstyle() {
  return GoogleFonts.lato(
    textStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 70),
  );
}

TextStyle _infoTextStyle() {
  return GoogleFonts.lato(
      textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 36));
}
