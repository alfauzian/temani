import 'package:flutter/material.dart';
import 'dart:math';

import '../../models/chatPage_models.dart';

Color _chatBackgroundColor = Color.fromARGB(255, 253, 171, 171);

class chatPage extends StatelessWidget {
  const chatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _chatAppBar(),
      body: _chatScreen(context),
    );
  }
}

AppBar _chatAppBar() {
  return AppBar(
    backgroundColor: _chatBackgroundColor,
    elevation: 0,
    actions: <Widget>[],
    title: Text('Sapa Bidan',
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
            fontFamily: 'Open-Sans')),
  );
}

Widget _chatScreen(BuildContext context) {
  
    return ListView.builder(
      itemCount: chat.length,
      itemBuilder: (context,index) {
        return Container(
          padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
                child: Text(chat[index].ChatContent),
        );
      },
    );
}
