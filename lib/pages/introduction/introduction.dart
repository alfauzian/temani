import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perkenalan'),
        centerTitle: true,
      ),
      body: Container(
          child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            validator: ((value) {
              if(value == null && value!.isEmpty) {
                return 'Masukan Nama anda';
              }
            }
          ))
        ],
      ))),
    );
  }
}
