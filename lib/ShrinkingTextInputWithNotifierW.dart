import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//TODO: bug1 when you hold down delete key the font doesn't change back
//TODO: when the widget loses focus it we can't edit the widget again

enum ShrinkingActionOptions { animateTextBox, giveFocus, clearText, noAction }

///Notifier compares the old value to the new value so if we pass a giveFocus and
/// another giveFocus the second action will not work because it has not changed.
/// If we pass an object (and update an id) then it will work because the objects
/// won't be the same.
class ShrinkingAction {
  final ShrinkingActionOptions action;
  int id;
  ShrinkingAction(this.action, this.id);

  ShrinkingAction copy(ShrinkingActionOptions action) {
    return ShrinkingAction(action, this.id + 1);
  }
}

//TODO: combine AutoShrinkTextC with this

//*****Widget*****
class ShrinkingTextInputWithNotifierW extends StatefulWidget {
  final ValueListenable<ShrinkingAction> listenAndAction;
  final bool hasFocus;
  final void Function(String) onTextChanged;
  final bool enabled;
  final TextStyle style;
  final String hintText;
  final void Function(String) onSubmitted;

  ShrinkingTextInputWithNotifierW(
    this.listenAndAction,
    this.onTextChanged,
    this.enabled,
    this.style,
    this.hintText, {
    required this.onSubmitted,
    this.hasFocus = true,
  });

  _ShrinkingTextInputWithNotifierWState createState() => _ShrinkingTextInputWithNotifierWState();
}

class _ShrinkingTextInputWithNotifierWState //
    extends State<ShrinkingTextInputWithNotifierW> with SingleTickerProviderStateMixin<ShrinkingTextInputWithNotifierW> {
  late AnimationController animationController;
  bool animationControllerIsDisposed = false;

  //Textfield state
  final GlobalKey _textFieldKey = GlobalKey();
  TextEditingController _controller = TextEditingController();
  late double _fontSize;
  late String _currentValue;
  FocusNode _focus = FocusNode();

  Animatable<Color> colorTween = TweenSequence<Color>([
    TweenSequenceItem(
      weight: 1.0,
      tween: Tween<Color>(
        begin: Colors.grey,
        end: Colors.red,
      ),
    ),
  ]);

  //need to pass in my

  void _onFocusChange() {
    animationController.reset();
  }

  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
    _fontSize = widget.style.fontSize!;
    _currentValue = _controller.text;
    animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _focus.addListener(_onFocusChange);

    widget.listenAndAction.addListener(() {
      switch (widget.listenAndAction.value.action) {
        case ShrinkingActionOptions.animateTextBox:
          if (!animationControllerIsDisposed) //
            animationController.repeat(reverse: true);
          break;
        case ShrinkingActionOptions.giveFocus:
          FocusScope.of(context).requestFocus(_focus);
          break;
        case ShrinkingActionOptions.clearText:
          setState(() {
            _currentValue = "";
            _controller.clear();
          });
          break;
        case ShrinkingActionOptions.noAction:
          break;
        default:
          throw UnexpectedTypeException();
      }
    });
  }

  void dispose() {
    animationControllerIsDisposed = true;
    animationController.dispose();
    super.dispose();
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
    return Column(
      children: [
        AnimatedBuilder(
            animation: animationController,
            builder: (BuildContext context, Widget? child) {
              return TextFormField(
                key: _textFieldKey,
                autofocus: widget.hasFocus,
                autocorrect: false,
                keyboardType: TextInputType.visiblePassword,
                controller: _controller,
                enabled: widget.enabled,
                focusNode: _focus,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  contentPadding: const EdgeInsets.all(0),
                  hintStyle: TextStyle(
                    color: colorTween.evaluate(AlwaysStoppedAnimation(animationController.value)),
                    fontSize: 25.0,
                    letterSpacing: -0.5,
                    fontWeight: FontWeight.w100,
                  ),
                  hintText: widget.hintText,
                ),
                style: widget.style.copyWith(fontSize: _fontSize),
                onFieldSubmitted: widget.onSubmitted,
              );
            }),
      ],
    );
  }

  Widget build(BuildContext context) => _buildTextForm();
}

class UnexpectedTypeException implements Exception {}
