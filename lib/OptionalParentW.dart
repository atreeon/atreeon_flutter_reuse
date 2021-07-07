import 'package:flutter/material.dart';

///Probably not optimal due to functional approach but useful for demos and non production code
class OptionalParentW extends StatelessWidget {
  final bool showParent;
  final Widget theWidget;
  final Widget Function(Widget) theChild;

  const OptionalParentW({Key? key, required this.showParent, required this.theWidget, required this.theChild}) : super(key: key);

  Widget build(BuildContext context) {
    if (showParent) //
      return theWidget;

    return theChild(theWidget);
  }
}
