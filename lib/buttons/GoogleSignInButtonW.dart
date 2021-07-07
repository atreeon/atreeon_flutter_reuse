import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../AtreeonReuseColors.dart';
import 'SignInButtonW.dart';

class SignInGoogleButtonW extends StatelessWidget {
  final void Function() onPress;

  SignInGoogleButtonW(this.onPress);

  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
        child: SignInButtonW(
          AtreeonReuseColors.googleRed,
          FontAwesomeIcons.googlePlusG,
          "Sign in with Google+",
          () async => onPress(),
        ));
  }
}
