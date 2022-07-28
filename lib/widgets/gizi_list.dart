import 'package:flutter/material.dart';
import 'package:temani/database/gizi_database.dart';
import 'package:temani/widgets/gizi_card.dart';
import 'package:temani/models/gizi.dart';

class GiziList extends StatelessWidget {
  var db = GiziDatabase();

  GiziList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FutureBuilder(
            future: db.getGizi(),
            initialData: [],
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              var data = snapshot.data;
              var datalength = data!.length;

              return datalength == 0
                  ? Center(
                      child: Text('Masukan Gizi hari ini'),
                    )
                  : ListView.builder(
                      itemCount: datalength,
                      itemBuilder: (context, i) => GiziCard(
                          id: data[i].id,
                          karbohidrat: data[i].karbohidrat,
                          protein: data[i].protein,
                          lemak: data[i].lemak));
            }));
  }
}
