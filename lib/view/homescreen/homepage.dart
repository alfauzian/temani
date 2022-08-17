import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:temani/controllers/InfoController.dart';
import 'package:temani/controllers/auth.dart';
import 'package:temani/logic/BMI.dart';
import 'package:temani/logic/dashboard_logic.dart';

class Dashboarda extends StatefulWidget {
  const Dashboarda({Key? key}) : super(key: key);

  @override
  State<Dashboarda> createState() => _DashboardaState();
}

class _DashboardaState extends State<Dashboarda> {

  late Timer timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  InfoController info = Get.put(InfoController());
  AuthController authC = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            color: Colors.grey[100],
            child: Column(
              children: [
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [Color(0xffB2C8DF), Color(0xffA8A4CE)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width:MediaQuery.of(context).size.width / 1.4,
                                    height:MediaQuery.of(context).size.height / 12,
                                    decoration: BoxDecoration(
                                        color: Color(0xffC4D7E0),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(30),
                                            bottomRight: Radius.circular(30))),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                              child: Container(
                                                child: Image.asset('assets/icons/profile_icon.png',scale: 12,
                                            ),
                                          )),
                                          SizedBox(width: 20,),
                                          Expanded(
                                            flex: 4,
                                            child: Column(
                                              mainAxisAlignment:MainAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:Alignment.centerLeft,
                                                  child: Text("Hai, ${authC.nama}",style: _appbarTitleStyle(),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:Alignment.centerLeft,
                                                  child: Text('${authC.alamat}',
                                                    style: GoogleFonts.lato(
                                                        textStyle: TextStyle(
                                                            fontSize: 12)),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                              child: FaIcon(FontAwesomeIcons.pen,size: 15,
                                          )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 35),
                                      child: GestureDetector(
                                        onTap: (){
                                          Get.find<AuthController>().logOut(false);
                                          print('terhapus');
                                        },
                                        child: FaIcon(
                                          FontAwesomeIcons.calendarDay,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )),
                              ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Container(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${info.minggu.toStringAsFixed(0)}',
                                      style: GoogleFonts.staatliches(textStyle: TextStyle(fontSize: 70)),
                                    ),
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text('Minggu',))
                                  ],
                                )),
                              ),
                              Expanded(
                                child: Container(
                                  child: Container(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${info.funcTrimester()}',
                                        style: GoogleFonts.staatliches(
                                            textStyle: TextStyle(fontSize: 70)),
                                      ),
                                      Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Text('Fase'))
                                    ],
                                  )),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          colors: [Color(0xffCEE5D0), Color(0xff94B49F)],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight),
                    ),
                    width: MediaQuery.of(context).size.width / 1.07,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: info.gambarKehamilan(),
                          ),
                          flex: 2,
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Expanded(
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment:MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "Tersisa :",
                                        style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 20)),
                                      ),
                                      Text(
                                        "${info.sisaKehamilan}",
                                        style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                                fontSize: 40,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                      Text(
                                        "hari",
                                        style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 20)),
                                      )
                                    ],
                                  ),
                                ),
                                flex: 1,
                              ),
                              Expanded(
                                  child: Center(
                                      child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Ukuran :",
                                      style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 20))),
                                  Row(
                                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      FaIcon(FontAwesomeIcons.scaleBalanced,size: 15,),

                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                    children: [
                                      FaIcon(FontAwesomeIcons.ruler,size: 15,),

                                    ],
                                  )
                                ],
                              ))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 0, top: 20),
                      child: Container(
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                          width:MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context).size.height,
                                          decoration: BoxDecoration(
                                              borderRadius:BorderRadius.circular(0)),
                                          child: Card(
                                            color: Colors.white,
                                            child: Column(
                                              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  child: Padding(
                                                    padding:const EdgeInsets.all(8.0),
                                                    child: FaIcon(
                                                      FontAwesomeIcons.weightScale,
                                                      size: 60,
                                                      color: Colors.black45,
                                                    ),
                                                  ),
                                                  alignment:Alignment.topCenter,
                                                ),
                                                Container(
                                                  child: Column(
                                                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Text(
                                                        '',
                                                        style: GoogleFonts.fredokaOne(
                                                        textStyle: TextStyle(fontSize:60))),
                                                      Container(
                                                        alignment: Alignment.bottomCenter,
                                                        width: MediaQuery.of(context).size.width,
                                                        child: Padding(
                                                          padding:EdgeInsets.only(top: 20),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              Column(
                                                                children: [
                                                                  Text('',
                                                                    style:
                                                                        _infoBMIStyle(),
                                                                  ),
                                                                  Text('kg')
                                                                ],
                                                              ),
                                                              Column(
                                                                children: [
                                                                  Text(
                                                                    '',
                                                                    style:
                                                                        _infoBMIStyle(),
                                                                  ),
                                                                  Text('cm')
                                                                ],
                                                              ),
                                                              Column(
                                                                children: [
                                                                  Text(
                                                                    '',
                                                                    style:
                                                                        _infoBMIStyle(),
                                                                  ),
                                                                  Text('Tahun')
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          )),
                                    ),
                                    Expanded(
                                      child: Container(
                                          width:MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context).size.height,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(30)),
                                          child: Card(
                                            child: Column(
                                              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  child: Padding(
                                                    padding:const EdgeInsets.all(8.0),
                                                    child: FaIcon(FontAwesomeIcons.bowlFood,size: 60,color: Colors.black45,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        '',
                                                        style: GoogleFonts.fredokaOne(textStyle:TextStyle(fontSize:50)),
                                                      ),
                                                      Container(
                                                          alignment: Alignment.bottomCenter,
                                                          width: MediaQuery.of(context).size.width,
                                                          child: Padding(
                                                            padding:EdgeInsets.only(top: 40),
                                                            child: Row(
                                                              mainAxisAlignment:MainAxisAlignment.spaceAround,
                                                              crossAxisAlignment:CrossAxisAlignment.center,
                                                              children: [
                                                                Column(
                                                                  children: [
                                                                    Text(
                                                                      '',
                                                                      style:
                                                                          _infoBMIStyle(),
                                                                    ),
                                                                    Text(
                                                                      'Karbo',
                                                                    )
                                                                  ],
                                                                ),
                                                                Column(
                                                                  children: [
                                                                    Text(
                                                                      '',
                                                                      style:
                                                                          _infoBMIStyle(),
                                                                    ),
                                                                    Text(
                                                                        'Lemak')
                                                                  ],
                                                                ),
                                                                Column(
                                                                  children: [
                                                                    Text(
                                                                      '',
                                                                      style:
                                                                          _infoBMIStyle(),
                                                                    ),
                                                                    Text(
                                                                        'Protein')
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ))
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )),
                    ))
              ],
            ),
          ),
        ));
  }
}

TextStyle _appbarTitleStyle() {
  return TextStyle(
      fontFamily: 'Open-Sans',
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color: Colors.black);
}

TextStyle _infoBMIStyle() {
  return GoogleFonts.lato(
      textStyle: TextStyle(fontSize: 32, fontWeight: FontWeight.w400));
}

TextStyle _infoIntiStyle() {
  return GoogleFonts.lato(
      textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w400));
}

TextStyle _infoDataIntiStyle() {
  return GoogleFonts.lato(
      textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.w500));
}
