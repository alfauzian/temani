import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temani/database/giziDB.dart';
import 'package:temani/models/gizi.dart';

NotesDatabase _database = NotesDatabase.instance;
Note? notes;

class GiziForm extends StatelessWidget {
  final String? name;
  final int? karbohidrat;
  final int? protein;
  final int? lemak;
  const GiziForm(
      {Key? key, this.name, this.karbohidrat, this.protein, this.lemak})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    TextEditingController nameC = TextEditingController();
    TextEditingController karbohidratC = TextEditingController();
    TextEditingController proteinC = TextEditingController();
    TextEditingController lemakC = TextEditingController();

    return AlertDialog(
      title: Text('Masukan Gizi'),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: nameC,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Nama makanan'),
              validator: ((value) {
                if (value == 0 && value!.isEmpty) {
                  return 'Masukan input yang benar';
                }
                return null;
              }),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Masukan kandungan'),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: karbohidratC,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Karbohidrat'),
              validator: ((value) {
                if (value == 0 && value!.isEmpty) {
                  return 'Masukan input yang benar';
                }
                return null;
              }),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: proteinC,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Protein'),
              validator: ((value) {
                if (value == 0 && value!.isEmpty) {
                  return 'Masukan input yang benar';
                }
                return null;
              }),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: lemakC,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Lemak'),
              validator: ((value) {
                if (value == 0 && value!.isEmpty) {
                  return 'Masukan input yang benar';
                }
                return null;
              }),
            ),
          ],
        ),
      ),
      actions: [
        CancelButton(),
        TextButton(
            onPressed: () async {
              if (notes == null) {
                notes = Note(
                    name: nameC.text,
                    karbohidrat: int.parse(karbohidratC.text),
                    protein: int.parse(proteinC.text),
                    lemak: int.parse(lemakC.text));
              }
              if (notes != null) return Get.back();
            },
            child: Text('SIMPAN'))
      ],
    );
  }

  Widget CancelButton() {
    return TextButton(
        onPressed: () {
          Get.back();
        },
        child: Text('CANCEL'));
  }

  void addNotes(Note object) async {
    int result = (await  _database.create(object)) as int;
    
  }
}
