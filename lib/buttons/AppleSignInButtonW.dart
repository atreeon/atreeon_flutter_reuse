import 'package:atreeon_flutter_reuse/AtreeonReuseColors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'SignInButtonW.dart';

class SignInAppleButtonW extends StatelessWidget {
  final void Function() onPress;

  SignInAppleButtonW(this.onPress);

  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
        child: SignInButtonW(
          AtreeonReuseColors.appleBlack,
          FontAwesomeIcons.apple,
          "Sign in with Apple",
          () async => onPress(),
        ));
  }
}
