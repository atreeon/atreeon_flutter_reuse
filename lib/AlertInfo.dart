import 'package:flutter/material.dart';

class AlertInfo extends StatelessWidget {
  final String? title;
  final String content;
  final Color backgroundColor;

  AlertInfo({
    required this.content,
    this.title = null,
    this.backgroundColor = const Color(0xFFFFFFFF),
  });

  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.of(context).pop(),
      child: AlertDialog(
        title: Text(title ?? ""),
        content: Text(content),
        elevation: 24.0,
        backgroundColor: backgroundColor,
      ),
    );
  }
}
