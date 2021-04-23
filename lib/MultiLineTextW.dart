import 'package:flutter/material.dart';

///Text box that will split onto a second line or shrink to container
///
///Used to expand a text to two lines instead of overflowing
/// after expanding to two lines it will shrink so it doesn't overflow
///
/// TODO: property to set the maximum of number of lines to split to
class MultiLineTextW extends StatelessWidget {
  final String _text;
  final TextStyle _style;
  final int _maxLine1Length;

  MultiLineTextW(this._text, this._style, this._maxLine1Length);

  Widget build(BuildContext context) {
    //todo: dependency, see DD on how to inject it?
    Widget textWidget;

    if (_text.length > _maxLine1Length && _text.contains(" ")) {
      var splits = splitWordsIntoTwo(_text);

      textWidget = Column(
        children: <Widget>[
          Text(splits[0], style: _style, maxLines: 1),
          Text(splits[1], style: _style, maxLines: 1),
        ],
      );
    } else {
      textWidget = Text(_text, style: _style, maxLines: 1);
    }

    return FittedBox(
      fit: BoxFit.scaleDown,
      child: textWidget,
    );
  }
}

typedef fn_splitStringInMiddle = List<String> Function(String text);

///Splits a string in half making the cut between the words
List<String> splitWordsIntoTwo(String text) {
  var rg = RegExp(r"(\b[^\s]+\b)", caseSensitive: false);
  var results = rg.allMatches(text);

  var goal = (text.length / 2).ceil();
  var list = results.toList();
  list.sort((x, y) => (x.end - goal).abs() - (y.end - goal).abs());
  var indexToSplit = list.first.end;
  var line1 = text.substring(0, indexToSplit).trim();
  var line2 = text.substring(indexToSplit, text.length).trim();

  return [line1, line2];
}
