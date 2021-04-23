import 'package:atreeon_flutter_reuse/AlertDialogW.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Demo_AlertDialogW(),
    );
  }
}

class Demo_AlertDialogW extends StatelessWidget {
  Widget build(BuildContext context) => Column(
        children: [
          Text("hello"),
          ElevatedButton(
            child: Text("Alert Diaglog"),
            onPressed: () {
              showDialog<String>(
                context: context,
                builder: (_) => AlertDialogYesNoW(
                  title: "Alert",
                  content: "Are you sure?",
                  onPressed: () => print("hello"),
                ),
              );
            },
          ),
        ],
      );
}
