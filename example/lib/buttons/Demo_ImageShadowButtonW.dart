import 'package:atreeon_flutter_reuse/buttons/ImageShadowButtonW.dart';
import 'package:flutter/material.dart';

class Demo_ImageShadowButtonW extends StatelessWidget {
  Widget build(BuildContext context) => Container(
          child: Column(
        children: [
          Center(child: ImageShadowButtonW(Image.asset('assets/dictionary.png'), Image.asset('assets/dictionary_shadow.png'), () => print('pressed'))),
          Center(
              child: ImageShadowButtonW(
            Image.asset('assets/dictionary.png'),
            Image.asset('assets/dictionary_shadow.png'),
            () => print('pressed'),
            buttonText: Text('Dictionary'),
          )),
          Center(
              child: Container(
                  height: 100,
                  child: FittedBox(
                      fit: BoxFit.contain,
                      child: ImageShadowButtonW(
                        Image.asset('assets/links/frencharrowwide.png'),
                        Image.asset('assets/links/frencharrowwideshadow.png'),
                        () => print('pressed'),
                        buttonText: Text('french arrow'),
                        offsetValue: 20.0,
                      )))),
        ],
      ));
}
