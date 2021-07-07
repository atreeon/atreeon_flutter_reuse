import 'package:flutter/material.dart';

///A toggle button that shows and hides an icon
class IconToggleButton extends StatelessWidget {
  final bool value;
  final IconData selected;
  final IconData notSelected;
  final void Function() onPressed;
  final double size;
  final Color selectedColor;
  final Color unselectedColor;
  IconToggleButton({
    required this.selected,
    required this.notSelected,
    required this.value,
    required this.onPressed,
    required this.size,
    this.selectedColor = Colors.blue,
    this.unselectedColor = const Color(0x22555555),
  });

  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: value //
          ? Icon(
              selected,
              color: selectedColor,
              size: size,
            )
          : Icon(
              notSelected,
              color: unselectedColor,
              size: size * 0.85,
            ),
    );
  }
}
