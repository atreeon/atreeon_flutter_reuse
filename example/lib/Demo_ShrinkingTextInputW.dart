import 'package:atreeon_flutter_reuse/ShrinkingTextInputW.dart';
import 'package:flutter/material.dart';

class Demo_ShrinkingTextInputW extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10.0),
            child: ShrinkingTextInputW(
              (text) => print("pressed"),
              true,
              TextStyle(fontSize: 20),
              "ecrivez!",
              onSubmitted: (x) => x,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10.0),
            child: ShrinkingTextInputW(
              (text) => print(text),
              false,
              TextStyle(fontSize: 10),
              "ecrivez!",
              onSubmitted: (x) => x,
            ),
          ),
        ],
      ),
    );
  }
}
