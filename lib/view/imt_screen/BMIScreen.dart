import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:temani/controllers/IMTController.dart';
import 'package:get/get.dart';

class BMISCREEN extends StatefulWidget {
  const BMISCREEN({Key? key}) : super(key: key);

  @override
  State<BMISCREEN> createState() => _BMISCREENState();
}

class _BMISCREENState extends State<BMISCREEN> {

  final imtC = Get.put(IMTController);

  Future<void> _showDialog() async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    autocorrect: false,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: 'Berat', border: OutlineInputBorder()),
                  ),
                  TextField(
                    autocorrect: false,

                    onChanged: (value) {
                      print('data tersimpan');
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: 'Tinggi', border: OutlineInputBorder()),
                  ),
                  ElevatedButton(
                    onPressed: () {

                      print('data tersimpannn');
                    },
                    child: Text("OK"),
                  )
                ],
              ));
        });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
          body: Container(
            child: Column(
              children: [
                Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '',
                                    style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            fontSize: 70,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    children: [
                                      Text(
                                        'BMI',
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                              fontSize: 36,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
                Flexible(
                  flex: 2,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            child: Row(
                              children: [
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                  ),
                                )),
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                              child: Container(
                                            width: MediaQuery.of(context).size.width,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Info',
                                                  style: _BMITextStyle(),
                                                ),

                                              ],
                                            ),
                                          )),
                                          Expanded(
                                              child: Container(
                                            width: MediaQuery.of(context).size.width,
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Saran',
                                                  style: _BMITextStyle(),
                                                ),

                                              ],
                                            ),
                                          ))
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        )),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: GestureDetector(
                            onTap: () => Get.to(_showDialog()),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Berat (kg)',
                                          style: _BMITextStyle(),
                                        ),
                                        Text(
                                          '',
                                          style: _BMINumTextStyle(),
                                        )
                                      ],
                                    )),
                                    Expanded(
                                        child: Column(
                                      mainAxisAlignment:MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Tinggi (cm)',
                                          style: _BMITextStyle(),
                                        ),
                                        Text(
                                         '',
                                          style: _BMINumTextStyle(),
                                        )
                                      ],
                                    )),

                                  ],
                                ),
                              ),
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
    );
  }
}

TextStyle _BMITextStyle() {
  return GoogleFonts.lato(
      textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500));
}

TextStyle _BMINumTextStyle() {
  return GoogleFonts.lato(
      textStyle: TextStyle(fontSize: 40, fontWeight: FontWeight.bold));
}
