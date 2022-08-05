import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:temani/logic/BMI.dart';
import 'package:temani/pages/BMI/inputBMI.dart';

class BMISCREEN extends StatefulWidget {
  const BMISCREEN({Key? key}) : super(key: key);

  @override
  State<BMISCREEN> createState() => _BMISCREENState();
}

class _BMISCREENState extends State<BMISCREEN> {
  Future<void> showInputDialog(BuildContext context) async {
    

    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Form(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  validator: ((value) {
                    return value!.isNotEmpty ? null : "invalid";
                  }),
                  decoration: InputDecoration(hintText: 'Masukan berat badan'),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  validator: ((value) {
                    return value!.isNotEmpty ? null : "invalid";
                  }),
                  decoration: InputDecoration(hintText: 'Masukan tinggi badan'),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  validator: ((value) {
                    return value!.isNotEmpty ? null : "invalid";
                  }),
                  decoration: InputDecoration(
                    hintText: 'Masukan usia',
                  ),
                ),
                OutlinedButton(onPressed: () {}, child: Text('Selesai'))
              ],
            )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((_) => BMI())),
        ListenableProvider(create: ((_) => BMI())),
      ],
      builder: (context, child) => SafeArea(
        child: Scaffold(
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
                                    '${Provider.of<BMI>(context).hasil.toStringAsFixed(1)}',
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
                                      Provider.of<BMI>(context).status()
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
                                    child: Provider.of<BMI>(context)
                                        .statusGambar(context),
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
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Info',
                                                  style: _BMITextStyle(),
                                                ),
                                                Provider.of<BMI>(context)
                                                    .tipsStatus()
                                              ],
                                            ),
                                          )),
                                          Expanded(
                                              child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Saran',
                                                  style: _BMITextStyle(),
                                                ),
                                                Provider.of<BMI>(context)
                                                    .saranStatus()
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
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: ((context) => InputBMI()))),
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
                                          '${Provider.of<BMI>(context).berat}',
                                          style: _BMINumTextStyle(),
                                        )
                                      ],
                                    )),
                                    Expanded(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Tinggi (cm)',
                                          style: _BMITextStyle(),
                                        ),
                                        Text(
                                          '${Provider.of<BMI>(context).tinggi}',
                                          style: _BMINumTextStyle(),
                                        )
                                      ],
                                    )),
                                    Expanded(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Usia',
                                          style: _BMITextStyle(),
                                        ),
                                        Text(
                                          '${Provider.of<BMI>(context).usia}',
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
          ),
        ),
      ),
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
