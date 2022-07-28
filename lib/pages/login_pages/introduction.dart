import 'package:flutter/material.dart';




Color _appbarColor = Color(0xffFFAEAE);





class introScreen extends StatefulWidget {
  const introScreen({Key? key}) : super(key: key);

  @override
  State<introScreen> createState() => _introScreenState();
}

class _introScreenState extends State<introScreen> {


  final _formState = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _appbarColor,
        title: Text("Perkenalan diri"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: _appbarColor,
        child: Column(
          children: [
            TextFormField(
              key: _formState,
              
            )
          ],
        ),
      ),
    );
  }
}