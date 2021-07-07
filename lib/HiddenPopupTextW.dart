import 'package:atreeon_flutter_reuse/AlertInfo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

///Example
///
/// HiddenPopupTextW(
//        content: "My Info",
//        child: Column(
//          children: [
//            Text("hello"),
//          ],
//        ),
//      );
class HiddenPopupTextW extends StatelessWidget {
  final Widget child;
  final String content;
  final String? title;
  final Color backgroundColor;

  HiddenPopupTextW({
    required this.child,
    required this.content,
    this.title = null,
    this.backgroundColor = const Color(0xFFFFFFFF),
  });

  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          bottom: 0,
          right: 0,
          child: Opacity(
            opacity: 0.3,
            child: IconButton(
              icon: Icon(FontAwesomeIcons.info),
              iconSize: 10,
              onPressed: () {
                showDialog<String>(
                  context: context,
                  builder: (_) => AlertInfo(
                    title: title,
                    content: content,
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
