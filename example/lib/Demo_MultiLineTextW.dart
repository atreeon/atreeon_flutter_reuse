import 'package:atreeon_flutter_reuse/MultiLineTextW.dart';
import 'package:flutter/material.dart';

class Demo_MultiLineTextW extends StatelessWidget {
  Widget build(BuildContext context) => Column(
        children: [
          Text("The "),
          MultiLineTextW("one line only", TextStyle(color: Colors.black, fontSize: 35), 30),
          MultiLineTextW("I am on two lines", TextStyle(color: Colors.black, fontSize: 35), 15),
          MultiLineTextW(
            "When I am very big I shrink...I am on two lines and am way way way way too long",
            TextStyle(color: Colors.black),
            15,
          ),
          MultiLineTextW("A different font", TextStyle(color: Colors.black, fontSize: 35), 15),
        ],
      );
}
