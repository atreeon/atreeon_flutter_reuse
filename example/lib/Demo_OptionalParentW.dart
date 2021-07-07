import 'package:atreeon_flutter_reuse/OptionalParentW.dart';
import 'package:flutter/material.dart';

class Demo_OptionalParentW extends StatefulWidget {
  _Demo_OptionalParentWState createState() => _Demo_OptionalParentWState();
}

class _Demo_OptionalParentWState extends State<Demo_OptionalParentW> {
  bool showParent = true;

  Widget build(BuildContext context) {
    var theWidget = Container(child: Text("hello"), color: Colors.blue, width: 200);
    return Column(
      children: [
        ElevatedButton(
          child: Text("Show parent"),
          onPressed: () => setState(() => showParent = !showParent),
        ),
        OptionalParentW(
          showParent: showParent,
          theWidget: theWidget,
          theChild: (x) => theWidget.child!,
        ),
      ],
    );
  }
}
