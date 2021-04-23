import 'package:flutter/material.dart';

class WrapTextAroundWidgetW extends StatelessWidget {
  final Widget widget;
  final double widgetWidth;
  final double widgetHeight;
  final EdgeInsetsGeometry margin;
  final List<InlineSpan> inlineSpans;

  WrapTextAroundWidgetW({
    required this.inlineSpans,
    required this.widget,
    required this.widgetWidth,
    required this.widgetHeight,
    required this.margin,
  });

  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var splitAtHeight = constraints.maxHeight - widgetHeight - (margin.vertical);
      var height = 0.0;
      var wordCounter = 1;

      while (height < splitAtHeight && wordCounter < inlineSpans.length) {
        final textPainter = TextPainter(
          textDirection: TextDirection.ltr,
          text: TextSpan(
            children: inlineSpans.take(wordCounter).toList(),
          ),
        );
        textPainter.layout(maxWidth: constraints.maxWidth);
        height = textPainter.height;
        wordCounter++;
      }

      return Stack(fit: StackFit.expand, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          if (height < splitAtHeight)
            Container(
              child: RichText(text: TextSpan(children: inlineSpans.take(wordCounter).toList())),
            ),
          if (height >= splitAtHeight) ...[
            Container(
              child: RichText(text: TextSpan(children: inlineSpans.take(wordCounter - 2).toList())),
            ),
            Container(
              width: constraints.maxWidth - widgetWidth - (margin.horizontal),
              child: RichText(text: TextSpan(children: inlineSpans.skip(wordCounter + 2).toList())),
            ),
          ],
        ]),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(margin: margin, child: widget),
        )
      ]);
    });
  }
}
