import 'package:atreeon_flutter_reuse/buttons/AppleSignInButtonW.dart';
import 'package:atreeon_flutter_reuse/buttons/FacebookSignInButtonW.dart';
import 'package:atreeon_flutter_reuse/buttons/GoogleSignInButtonW.dart';
import 'package:flutter/material.dart';

class Demo_signInButtonsW extends StatelessWidget {
  Widget build(BuildContext context) => Container(
        child: Column(
          children: [
            SignInFacebookButtonW(() => print("pressed")),
            SignInGoogleButtonW(() => print("pressed")),
            SignInAppleButtonW(() => print("apple")),
          ],
        ),
      );
}
