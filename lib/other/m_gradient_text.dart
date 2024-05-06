import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class MGradientText extends StatefulWidget {
  final String text;
  final List<Color>? colors;
  final TextStyle? style;

  MGradientText(this.text, {this.colors, this.style});

  @override
  State<MGradientText> createState() => _MGradientTextState();
}

class _MGradientTextState extends State<MGradientText> {
  double textOffset = 0.0;

  @override
  void initState() {
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
      if (!mounted) return;
      textOffset = (context.findRenderObject() as RenderBox?)
              ?.localToGlobal(Offset.zero)
              .dx ??
          0;
      setState(() {});
    });
    super.initState();
  }

  Size boundingTextSize(String? text, TextStyle style,
      {int maxLines = 2 ^ 31, double maxWidth = double.infinity}) {
    if (text == null || text.isEmpty) {
      return Size.zero;
    }
    final TextPainter textPainter = TextPainter(
        textDirection: TextDirection.ltr,
        text: TextSpan(text: text, style: style),
        maxLines: maxLines)
      ..layout(maxWidth: maxWidth);
    return textPainter.size;
  }

  @override
  Widget build(BuildContext context) {
    final style = widget.style ?? TextStyle(fontSize: 26);
    final List<Color> colors = widget.colors ?? [Colors.red, Colors.yellow];
    return Text(
      widget.text,
      style: style.copyWith(
        foreground: Paint()
          ..shader = ui.Gradient.linear(
            Offset(textOffset, 10),
            Offset(textOffset + boundingTextSize(widget.text, style).width, 10),
            colors,
            List.generate(
              colors.length,
              (index) {
                if (index == 0) return 0;
                final valueStopColor = index / (colors.length - 1);
                return valueStopColor;
              },
            ),
          ),
      ),
    );
  }
}
