import 'package:flutter/material.dart';

class CustomButtonW extends StatelessWidget {
  final Widget child;
  final void Function() onPress;

  const CustomButtonW({
    Key? key,
    required this.child,
    required this.onPress,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return InkWell(
      child: child,
      onTap: onPress,
    );
  }
}
