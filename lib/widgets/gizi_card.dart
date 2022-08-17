import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

class CardGizi extends StatelessWidget {
  const CardGizi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 10,
      child: Card(
        elevation: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            LineIcon.plus(
              size: 40,
            ),
            
          ],
        ),
      ),
    );
  }
}
