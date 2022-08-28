import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:temani/database/giziDB.dart';
import 'package:temani/models/gizi.dart';
import 'package:temani/widgets/gizi_card.dart';

class GiziList extends StatefulWidget {
  const GiziList({Key? key}) : super(key: key);

  @override
  State<GiziList> createState() => _GiziListState();
}

class _GiziListState extends State<GiziList> {
  late List<Note> notes = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshNotes();
  }

  @override
  void dispose() {

    super.dispose();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    this.notes = await NotesDatabase.instance.readAllNotes();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : notes.isEmpty
              ? Center(child: Text('Tidak Ada'))
              : BuildNotes(),
    );
  }

  Widget BuildNotes() {
    return ListView.builder(
        itemCount: notes.length,
        itemBuilder: ((context, index) {
          final note = notes[index];
          return Container(
            child: GiziCard(note: note, index: index),
          );
        }));
  }
}
