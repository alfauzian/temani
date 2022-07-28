import 'package:flutter/material.dart';

class BMIform extends StatefulWidget {
  const BMIform({Key? key}) : super(key: key);

  @override
  State<BMIform> createState() => _BMIformState();
}

class _BMIformState extends State<BMIform> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextField()
        ],
      ),
    );
  }
}
