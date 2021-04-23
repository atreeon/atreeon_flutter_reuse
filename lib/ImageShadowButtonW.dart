import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

///Shadow button
///Important: the images should have a default size that
///match their image sizes
///https://stackoverflow.com/questions/54340675/failed-assertion-width-0-0-is-not-true-when-placing-single-image-in-containe/57625523#57625523
class ImageShadowButtonW extends StatefulWidget {
  final Text? buttonText;
  final Image initialImage;
  final Image shadowImage;
  final Function onPress;
  final double offsetValue;

  ImageShadowButtonW(
    this.initialImage,
    this.shadowImage,
    this.onPress, {
    this.buttonText,
    this.offsetValue = 5.0,
  });

  _ButtonImageShadow createState() => _ButtonImageShadow();
}

class _ButtonImageShadow extends State<ImageShadowButtonW> {
  late double _offsetTop;
  late double _offsetRight;

  void initState() {
    _offsetTop = widget.offsetValue * -1;
    _offsetRight = widget.offsetValue;
    super.initState();
  }

//  _ButtonImageShadow();

  Widget build(BuildContext context) => GestureDetector(
        onTapDown: (x) => depressedButton(),
        onTapUp: (x) {
          pressedButton();
          widget.onPress();
        },
        onTapCancel: () => pressedButton(),
        child: Column(
          children: _children(widget.buttonText),
        ),
      );

  List<Widget> _children(Text? buttonText) {
    var children = <Widget>[];

    children.add(Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Padding(padding: EdgeInsets.only(top: widget.offsetValue), child: widget.shadowImage),
        AnimatedPositioned(
          duration: Duration(milliseconds: 150),
          child: widget.initialImage,
          top: _offsetTop,
          right: _offsetRight,
        ),
      ],
    ));

    if (buttonText != null) //
      children.add(buttonText);

    return children;
  }

  void depressedButton() {
    setState(() {
      _offsetTop = 0.0;
      _offsetRight = 0.0;
    });
  }

  void pressedButton() {
    setState(() {
      _offsetTop = widget.offsetValue * -1;
      _offsetRight = widget.offsetValue;
    });
  }
}
