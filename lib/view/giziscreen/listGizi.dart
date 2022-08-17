import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temani/controllers/GiziController.dart';
import 'package:temani/database/gizi_database.dart';
import 'package:temani/models/gizi.dart';
import 'package:temani/widgets/gizi_card.dart';

class ListCardGizi extends StatefulWidget {

  @override
  State<ListCardGizi> createState() => _ListCardGiziState();
}

class _ListCardGiziState extends State<ListCardGizi> {
  List<GiziModelToDB>? listGizi;
  GiziController giziC = Get.put(GiziController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    refreshGizi();
  }



  Future refreshGizi() async {
    this.listGizi = await GiziDatabase.instances.readAllData();
  }

  @override
  Widget build(BuildContext context) {
    bool ada = false;
    return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: ((context, index) {
              final _listGizi = listGizi?[index];
              return GestureDetector(
                onLongPress: () {
                   showDialog(context: context, builder: (context) {
                     return AlertDialog(
                       title: Text('Hapus'),
                       content: Text("Ingin menghapus data Gizi ini ?"),
                       actions: [
                         TextButton(onPressed: () {
                           Get.back();
                         }, child: Text('TIDAK')),
                         TextButton(onPressed: () {

                         }, child: Text('YA'))
                       ],
                     );
                   });
                },
                  child: CardGizi());
            }));
  }
}

