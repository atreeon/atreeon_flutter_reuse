import 'package:flutter/material.dart';

///Example
///
///           ElevatedButton(
///            child: Text("Alert Diaglog"),
///            onPressed: () {
///              showDialog(
///                context: context,
///                builder: (_) => AlertDialogYesNoW(
///                  title: "Alert",
///                  content: "Are you sure?",
///                  onPressed: () => print("hello"),
///                ),
///              );
///            },
///          ),
class AlertDialogYesNoW extends StatelessWidget {
  final String title;
  final String content;
  final void Function() onPressed;
  final Color backgroundColor;

  AlertDialogYesNoW({
    required this.title,
    required this.content,
    required this.onPressed,
    this.backgroundColor = const Color(0xFFEF9A9A), //Colors.red[200] - pale red
  });

  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          child: Text(
            "No",
            style: TextStyle(color: Colors.black87),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: Text("Yes", style: TextStyle(color: Colors.black87)),
          onPressed: onPressed,
        ),
      ],
      elevation: 24.0,
      backgroundColor: backgroundColor,
    );
  }
}
