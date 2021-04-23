import 'package:flutter/material.dart';

///Just a FittedBox component with BoxFit.contain specified as the fit parameter
///
///This will shrink whatever is inside the container so it fits inside its parent
class ContainedBoxW extends StatelessWidget {
  final Widget widget;
  ContainedBoxW(this.widget);

  Widget build(BuildContext context) => //
      FittedBox(fit: BoxFit.contain, child: widget);
}
