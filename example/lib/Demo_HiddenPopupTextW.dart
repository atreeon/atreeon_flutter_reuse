import 'package:atreeon_flutter_reuse/HiddenPopupTextW.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Demo_HiddenPopupText()),
    );
  }
}

class Demo_HiddenPopupText extends StatelessWidget {
  Widget build(BuildContext context) => HiddenPopupTextW(
        content: """sdjlkf
        lkaj sdlkj lkas jdflkj aslkd jlksd jlksadj lkjasdlkf jasldjflksadjflksadjf lksdj flksdjf lksadj flkajs ldfk sldkf jlksdjf lkasjd flksdj flksjd fl ksjdlf kjslkdf jlsakdjf lskdjf lksadj lksadjf lksdj flksdjlksdjalk sdjl
        lkaj sdlkj lkas jdflkj aslkd jlksd jlksadj lkjasdlkf jasldjflksadjflksadjf lksdj flksdjf lksadj flkajs ldfk sldkf jlksdjf lkasjd flksdj flksjd fl ksjdlf kjslkdf jlsakdjf lskdjf lksadj lksadjf lksdj flksdjlksdjalk sdjl
        lkaj sdlkj lkas jdflkj aslkd jlksd jlksadj lkjasdlkf jasldjflksadjflksadjf lksdj flksdjf lksadj flkajs ldfk sldkf jlksdjf lkasjd flksdj flksjd fl ksjdlf kjslkdf jlsakdjf lskdjf lksadj lksadjf lksdj flksdjlksdjalk sdjl
        lkaj sdlkj lkas jdflkj aslkd jlksd jlksadj lkjasdlkf jasldjflksadjflksadjf lksdj flksdjf lksadj flkajs ldfk sldkf jlksdjf lkasjd flksdj flksjd fl ksjdlf kjslkdf jlsakdjf lskdjf lksadj lksadjf lksdj flksdjlksdjalk sdjl
        lkaj sdlkj lkas jdflkj aslkd jlksd jlksadj lkjasdlkf jasldjflksadjflksadjf lksdj flksdjf lksadj flkajs ldfk sldkf jlksdjf lkasjd flksdj flksjd fl ksjdlf kjslkdf jlsakdjf lskdjf lksadj lksadjf lksdj flksdjlksdjalk sdjl
        lkaj sdlkj lkas jdflkj aslkd jlksd jlksadj lkjasdlkf jasldjflksadjflksadjf lksdj flksdjf lksadj flkajs ldfk sldkf jlksdjf lkasjd flksdj flksjd fl ksjdlf kjslkdf jlsakdjf lskdjf lksadj lksadjf lksdj flksdjlksdjalk sdjl
        lkaj sdlkj lkas jdflkj aslkd jlksd jlksadj lkjasdlkf jasldjflksadjflksadjf lksdj flksdjf lksadj flkajs ldfk sldkf jlksdjf lkasjd flksdj flksjd fl ksjdlf kjslkdf jlsakdjf lskdjf lksadj lksadjf lksdj flksdjlksdjalk sdjl
        lkaj sdlkj lkas jdflkj aslkd jlksd jlksadj lkjasdlkf jasldjflksadjflksadjf lksdj flksdjf lksadj flkajs ldfk sldkf jlksdjf lkasjd flksdj flksjd fl ksjdlf kjslkdf jlsakdjf lskdjf lksadj lksadjf lksdj flksdjlksdjalk sdjl
        lkaj sdlkj lkas jdflkj aslkd jlksd jlksadj lkjasdlkf jasldjflksadjflksadjf lksdj flksdjf lksadj flkajs ldfk sldkf jlksdjf lkasjd flksdj flksjd fl ksjdlf kjslkdf jlsakdjf lskdjf lksadj lksadjf lksdj flksdjlksdjalk sdjl
        asdf""",
        child: Column(
          children: [
            Text("hello"),
            Text("blim"),
            Text("blah sdlkj lska dlkjs dflkjlkjl kj"),
            Text("flop"),
            Text("hello"),
            Text("hello"),
          ],
        ),
      );
}
