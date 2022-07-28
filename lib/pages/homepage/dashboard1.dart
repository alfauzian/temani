import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:temani/widgets/week_listview.dart';

Color _primaryColor = Color(0xffFBD6D2);
Color _cardColor = Color(0xffFFCFCF);
Color _dateColor = Color(0xffFBC5C5);
Color _selectedDateColor = Color(0xffFFC4C4);

Color _primaryLinearDashboard = Color(0xffe39393);
Color _secondaryLinearDashboard = Color(0xfffc5f44);
Color _thirdLinearDashboard = Color(0xffe4897e);

int mingguKehamilan = 5;
int hariKehamilan = 0;
int _trimester = 1;

final List<String> imgList = [];

late DateTime _selectedDate = DateTime.now();

final _controller = ValueNotifier<bool>(false);

bool _checked = false;

_gantiMinggu() {
  if (mingguKehamilan <= 4) {
    return Text("Kacang");
  } else if (mingguKehamilan > 4 && mingguKehamilan <= 7) {
    return Text("Blueberry");
  } else if (mingguKehamilan > 7 && mingguKehamilan <= 9) {
    return Text("Anggur");
  } else if (mingguKehamilan > 9 && mingguKehamilan <= 11) {
    return Text("data");
  } else if (mingguKehamilan > 9 && mingguKehamilan <= 11) {
    return Text("data");
  } else if (mingguKehamilan > 9 && mingguKehamilan <= 11) {
    return Text("data");
  } else if (mingguKehamilan > 9 && mingguKehamilan <= 11) {
    return Text("data");
  } else if (mingguKehamilan > 9 && mingguKehamilan <= 11) {
    return Text("data");
  } else if (mingguKehamilan > 9 && mingguKehamilan <= 11) {
    return Text("data");
  }
}

_gambarKehamilan() {
  if (mingguKehamilan <= 4) {
    return Image.asset('assets/images/Buah_kandungan_4.png');
  } else if (mingguKehamilan > 4 && mingguKehamilan <= 7) {
    return Image.asset('assets/images/Buah_kandungan_7.png');
  } else if (mingguKehamilan > 7 && mingguKehamilan <= 9) {
    return Image.asset('assets/images/Buah_kandungan_9.png');
  } else if (mingguKehamilan > 9 && mingguKehamilan <= 11) {
    return Image.asset('assets/images/Buah_kandungan_11.png');
  }
}

_gantiMingguHari() {
  if (_checked == false) {
    return Text("$mingguKehamilan Minggu", style: _textMinggu());
  } else if (_checked == true) {
    return Text("$hariKehamilan Hari", style: _textMinggu());
  }

  return null;
}

class dashBoard extends StatefulWidget {
  const dashBoard({Key? key}) : super(key: key);

  @override
  State<dashBoard> createState() => _dashBoardState();
}

class _dashBoardState extends State<dashBoard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller.addListener(() {
      setState(() {
        if (_controller.value) {
          _checked = true;
        } else {
          _checked = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _appBar(context),
      body: _buildDashboard(context),
    );
  }
}

Widget _buildDashboard(BuildContext context) {
  return Container(
    color: _cardColor,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            color: _primaryColor,
            child: WeekListView(),
          ),
        ),
        Expanded(
          flex: 8,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        gradient: RadialGradient(
                            colors: [Colors.white54, _dateColor])),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 1.7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white24,
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    child: Center(
                                      child: Text(
                                        "Trimester $_trimester",
                                        style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white24,
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      child: Center(
                                        child: Text("Minggu $mingguKehamilan",
                                            style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight:
                                                        FontWeight.w500))),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: _gambarKehamilan(),
                            ),
                          ),
                          flex: 2,
                        ),
                        Expanded(child: _gantiMinggu()),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 1.1,
                              decoration: BoxDecoration(
                                  gradient: RadialGradient(colors: [
                                Colors.white24,
                                Colors.white24
                              ])),
                              child: Row(
                                children: [
                                  Flexible(
                                      child: Center(
                                    child: Text(
                                      "59 kg",
                                      style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700)),
                                    ),
                                  )),
                                  Flexible(
                                      child: Center(
                                    child: Text(
                                      "0.03",
                                      style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700)),
                                    ),
                                  )),
                                  Flexible(
                                      child: Center(
                                    child: Text(
                                      "Normal",
                                      style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700)),
                                    ),
                                  )),
                                ],
                              ),
                            ),
                          ),
                          flex: 1,
                        )
                      ],
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 3),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              child: Card(
                color: _cardColor,
                elevation: 3,
              ),
            ),
          ),
          flex: 2,
        )
      ],
    ),
  );
}

TextStyle _textUsia() {
  return TextStyle(
      fontFamily: 'Montserrat', fontSize: 16, fontWeight: FontWeight.w500);
}

TextStyle _textMinggu() {
  return TextStyle(
      fontFamily: 'Montserrat', fontSize: 24, fontWeight: FontWeight.w600);
}

AppBar _appBar(BuildContext context) {
  return AppBar(
    title: Text(
      DateFormat.MMMMEEEEd().format(DateTime.now()),
      style: _appbarTitleStyle(),
    ),
    elevation: 0,
    backgroundColor: _primaryColor,
    actions: <Widget>[
      IconButton(onPressed: () {}, icon: Icon(Icons.calendar_today))
    ],
  );
}

TextStyle _appbarTitleStyle() {
  return TextStyle(
      fontFamily: 'Open-Sans',
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color: Colors.white60);
}

TextStyle _faseTexstyle() {
  return TextStyle(
      fontFamily: 'Open-Sans', fontWeight: FontWeight.w800, fontSize: 16);
}

_gakGuna() {
  return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
      child: Row(
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Lama kandungan",
                style: _textUsia(),
              ),
              _gantiMingguHari()
            ],
          )),
          Expanded(
              child: Center(
            child: AdvancedSwitch(
              controller: _controller,
              activeColor: Color(0xffB2A4FF),
              inactiveColor: Color(0xffFFDEB4),
              inactiveChild: Text("Minggu"),
              activeChild: Text("Hari"),
              width: 100,
              height: 40,
            ),
          ))
        ],
      ));
}

_listview() {
  return ListView.builder(
    itemCount: 45,
    scrollDirection: Axis.horizontal,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        height: 50,
        width: 100,
        margin: EdgeInsets.all(8),
        child: Center(
            child: Text(
          "Week $index",
          style: GoogleFonts.lato(
              textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        )),
      );
    },
  );
}
