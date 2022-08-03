import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:temani/logic/BMI.dart';

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
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> InputBMI())),
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



class InputBMI extends StatefulWidget {
  @override
  State<InputBMI> createState() => _InputBMIState();
}

class _InputBMIState extends State<InputBMI> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ListenableProvider(create: ((context) => BMI()))],
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: Text('Input IMT'),
          centerTitle: true,
        ),
        body: Container(
            child: Column(
          children: [
            Expanded(
                child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Berat',
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w400)),
                    ),
                    Text(
                      '${Provider.of<BMI>(context).berat}',
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () =>
                                Provider.of<BMI>(context, listen: false)
                                    .changeBeratMin(),
                            child: FaIcon(FontAwesomeIcons.minus)),
                        ElevatedButton(
                            onPressed: () {},
                            child: FaIcon(FontAwesomeIcons.plus))
                      ],
                    )
                  ],
                ),
              ),
            )),
            Expanded(
                child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Tinggi',
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w400))),
                 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: (){},
                            child: FaIcon(FontAwesomeIcons.minus)),
                        ElevatedButton(
                            onPressed: () {},
                            child: FaIcon(FontAwesomeIcons.plus))
                      ],
                    )
                  ],
                ),
              ),
            )),
            Expanded(
                child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Usia',
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w400))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: (){},
                            child: FaIcon(FontAwesomeIcons.minus)),
                        ElevatedButton(
                            onPressed: (){},
                            child: FaIcon(FontAwesomeIcons.plus))
                      ],
                    )
                  ],
                ),
              ),
            )),
            ElevatedButton(onPressed: () => Navigator.pop(context, MaterialPageRoute(builder: ((context) => BMISCREEN()))), child: Text('Submit'))
          ],
        )),
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
