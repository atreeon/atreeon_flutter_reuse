import 'package:atreeon_flutter_reuse/WrapTextAroundWidgetW_nu_.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Demo_WrapTextAroundWidgetW_nu_ extends StatelessWidget {
  final String text = "Do not pray for easy lives. Pray to be stronger men. Do not pray for tasks equal to your powers. Pray for powers equal to your tasks. Then the doing of your work shall be no miracle, but you shall be the miracle - Phillips Brooks (1835 - 1893)";

  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(child: Container(color: Colors.red)),
      Container(
          height: 175,
          child: WrapTextAroundWidgetW(
            widget: Icon(FontAwesomeIcons.child, size: 75),
            widgetHeight: 75,
            widgetWidth: 75,
            inlineSpans: splitOnWhitespace(text, TextStyle(fontSize: 18, color: Colors.black)),
            margin: const EdgeInsets.all(5),
          ))
    ]);
  }

  List<InlineSpan> splitOnWhitespace(String text, TextStyle style) {
    return text.split(RegExp(r"\s")).map((x) => TextSpan(text: x + " ", style: style)).toList();
  }
}
