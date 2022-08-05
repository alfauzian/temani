import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:temani/logic/BMI.dart';
import 'package:temani/pages/BMI/BMIScreen.dart';

class InputBMI extends StatefulWidget {
  const InputBMI({Key? key}) : super(key: key);

  @override
  State<InputBMI> createState() => _InputBMIState();
}

class _InputBMIState extends State<InputBMI> {

  
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => BMI(),
      builder: (context, child) => Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: Column(
                children: [
                  Text('Berat (kg)'),
                  Row(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            return Provider.of<BMI>(context, listen: false).changeBeratMin();
                          } ,
                          child: FaIcon(FontAwesomeIcons.minus)),
                      Text('${Provider.of<BMI>(context).berat}'),
                      ElevatedButton(
                          onPressed: () {},
                          child: FaIcon(FontAwesomeIcons.minus)),
                    ],
                  )
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
