import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temani/controllers/IMTController.dart';

IMTController imtC = Get.put(IMTController());

class BMIDialog extends StatefulWidget {
  const BMIDialog({Key? key}) : super(key: key);

  @override
  _BMIDialogState createState() => _BMIDialogState();
}

class _BMIDialogState extends State<BMIDialog> {



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Masukan Berat dan Tinggi badan'),
      content: Form(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller:imtC.berat,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'berat',
                  border: OutlineInputBorder()
                ),
              ),
              TextFormField(
                controller:imtC.tinggi,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'tinggi',
                    border: OutlineInputBorder()
                ),
              )
            ],
          ),
        ),
      ),
      actions: [
      cancelBtn(context),
      addButton(context)  
      ],
    );
  }
}

Widget cancelBtn(BuildContext context) {
  return TextButton(onPressed: ()=> Get.back(), child: Text('Batal'));
}

Widget addButton(BuildContext context) {
  return TextButton(
      onPressed: () {
        imtC.inputBMI(
          double.parse(imtC.berat.text),
          double.parse(imtC.tinggi.text));
          imtC.calculateIMT();
          Get.back();
      },
      child: Text('Masukan'));
}
