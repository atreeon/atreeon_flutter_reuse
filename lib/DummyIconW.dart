import 'package:flutter/material.dart';

///Just a dummy icon, as a placeholder before I code it up for real
class DummyIconW extends StatelessWidget {
  final IconData _icon;
  final Color _color;
  DummyIconW(this._icon, [this._color = Colors.black]);

  Widget build(context) {
    return InkWell(
      child: Icon(
        _icon,
        color: _color,
      ),
      onTap: () => print('dummy icon press: ' + _icon.toString()),
    );
  }
}
