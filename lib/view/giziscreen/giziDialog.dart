import 'package:flutter/material.dart';

class GiziDialog extends StatefulWidget {
  const GiziDialog({Key? key}) : super(key: key);

  @override
  State<GiziDialog> createState() => _GiziDialogState();
}

class _GiziDialogState extends State<GiziDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Masukan Gizi'),
      content: Column(
        children: [
          TextField(
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          TextField(
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          TextField(
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
        ],
      ),
    );
  }
}
