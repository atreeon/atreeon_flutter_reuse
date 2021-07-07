import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../AtreeonReuseColors.dart';
import 'SignInButtonW.dart';

class SignInFacebookButtonW extends StatelessWidget {
  final void Function() onPress;

  SignInFacebookButtonW(this.onPress);

  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: SignInButtonW(
          AtreeonReuseColors.facebookBlue,
          FontAwesomeIcons.facebookF,
          "Sign in with Facebook",
          onPress,
        ));
  }
}
