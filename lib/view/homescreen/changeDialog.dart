import 'package:flutter/material.dart';
import 'package:temani/controllers/InfoController.dart';
import 'package:temani/controllers/auth.dart';
import 'package:get/get.dart';

class ChangeDialog extends StatelessWidget {
  const ChangeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authC = Get.put(AuthController());
    InfoController infoC = Get.put(InfoController());
    return AlertDialog(
      title: Text('Ubah data'),
      content: Form(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: infoC.nama,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Ubah nama'),
          ),
          TextFormField(
            controller: infoC.alamat,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Ubah alamat'),
          ),
          TextFormField(
            controller: infoC.hari,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Ubah hari'),
          ),
        ],
      )),
      actions: [
        TextButton(onPressed: () => Get.back(), child: Text('Batal')),
        TextButton(
            onPressed: () {
              authC.changeName(infoC.nama.text, infoC.alamat.text,
                  int.parse(infoC.hari.text));
              Get.back();
            },
            child: Text('Simpan')),
      ],
    );
  }
}
