import 'package:flutter/material.dart';

///Rows and columns spread overa  number of columns (default of 2)
class FixedGridViewW extends StatelessWidget {
  final List<Widget> children;
  final int noColumns;

  FixedGridViewW(this.children, {this.noColumns = 2});

  Widget build(BuildContext context) {
    var currentRowChildren = <Widget>[];
    var columnChildren = <Widget>[];
    while (children.length > 0) {
      var nextChild = children.removeLast();
      currentRowChildren.add(Expanded(child: nextChild));

      if (currentRowChildren.length >= noColumns || children.length <= 0) {
        if (currentRowChildren.length != noColumns) {
          // we add blank elements
          while (currentRowChildren.length != noColumns) {
            currentRowChildren.add(Expanded(
              child: Container(),
            ));
          }
        }

        columnChildren.add(
          Expanded(
            child: Row(
              children: currentRowChildren,
            ),
          ),
        );

        currentRowChildren = <Widget>[];
      }
    }

    return Expanded(
        child: Column(
      children: columnChildren,
    ));
  }
}
