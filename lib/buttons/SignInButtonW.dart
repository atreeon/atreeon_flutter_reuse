import 'package:flutter/material.dart';

class SignInButtonW extends StatelessWidget {
  final Color _color;
  final IconData _iconData;
  final String _text;
  final void Function()? _onPressed;

  SignInButtonW(this._color, this._iconData, this._text, this._onPressed);

  Widget build(BuildContext context) {
    return Container(
        height: 50.0,
        // margin: const EdgeInsets.only(left: 10.0, right: 20.0),
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.black38),
          borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
          color: _color,
        ),
        child: TextButton(
          child: Row(children: [
            Container(
              padding: const EdgeInsets.only(right: 15.0, left: 5.0),
              child: Icon(_iconData, size: 40.0, color: Colors.white),
            ),
            Container(
              decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.black)),
            ),
            Expanded(
                child: Text(
              _text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            )),
          ]),
          onPressed: _onPressed,
        ));
  }
}
