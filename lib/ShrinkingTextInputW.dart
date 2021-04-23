import 'package:flutter/material.dart';

//TODO: bug1 when you hold down delete key the font doesn't change back
//TODO: when the widget loses focus it we can't edit the widget again

class ShrinkingTextInputW extends StatefulWidget {
  final void Function(String) onTextChanged;
  final bool enabled;
  final TextStyle style;
  final String hintText;
  final void Function(String) onSubmitted;

  ShrinkingTextInputW(
    this.onTextChanged,
    this.enabled,
    this.style,
    this.hintText, {
    required this.onSubmitted,
  });

  _ShrinkingTextInputWState createState() => _ShrinkingTextInputWState();
}

class _ShrinkingTextInputWState extends State<ShrinkingTextInputW> {
  final GlobalKey _textFieldKey = GlobalKey();

  TextEditingController _controller = TextEditingController();
  late double _fontSize;
  late String _currentValue;

  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
    _fontSize = widget.style.fontSize!;
    _currentValue = _controller.text;
  }

  void _onTextChanged() {
    widget.onTextChanged(_controller.text);

    // substract text field padding to get available space
    final inputWidth = _textFieldKey.currentContext!.size!.width; // - textFieldPadding.horizontal;

    // calculate width of text using text painter
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: _controller.text,
        style: widget.style,
      ),
    );
    textPainter.layout();

    var textWidth = textPainter.width;
    var fontSize = _fontSize;

    textPainter.text = TextSpan(
      text: _controller.text,
      style: widget.style.copyWith(fontSize: fontSize),
    );
    textPainter.layout();
    textWidth = textPainter.width;

    if (_controller.text.length >= _currentValue.length) {
      while (textWidth > inputWidth && fontSize > 15.0 && fontSize <= widget.style.fontSize! + 1) {
        textPainter.text = TextSpan(
          text: _controller.text,
          style: widget.style.copyWith(fontSize: fontSize),
        );
        textPainter.layout();
        textWidth = textPainter.width;
        fontSize -= 1;
      }
    } else if (_currentValue.length == _controller.text.length) {
    } else {
      while (textWidth + 25 < inputWidth && fontSize >= 15.0 && fontSize <= widget.style.fontSize!) {
        textPainter.text = TextSpan(
          text: _controller.text,
          style: widget.style.copyWith(fontSize: fontSize),
        );
        textPainter.layout();
        textWidth = textPainter.width;
        fontSize += 1;
      }
    }

    // not really efficient and doesn't find the perfect size, but you got all you need!

    setState(() {
      _fontSize = fontSize;
      _currentValue = _controller.text;
    });
  }

  Widget _buildTextForm() {
    return TextFormField(
      key: _textFieldKey,
//      enableSuggestions: false,
      autofocus: true,
      autovalidateMode: AutovalidateMode.disabled,
//      autovalidate: false,
      autocorrect: false,
      keyboardType: TextInputType.visiblePassword,
      controller: _controller,
      enabled: widget.enabled,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.grey, fontSize: 25.0, letterSpacing: -0.5, fontWeight: FontWeight.w100),
        hintText: widget.hintText,
      ),
      style: widget.style.copyWith(fontSize: _fontSize),
      onFieldSubmitted: widget.onSubmitted,
    );
  }

  Widget build(BuildContext context) => _buildTextForm();
}
