import 'package:flutter/material.dart';

class MText extends Text {
  final MText? modifier;
  final String? data;

  MText({
    required this.modifier,
    required this.data,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) : super(
          data ?? modifier?.data ?? '',
          style: TextStyle(
            color: color ?? modifier?.style?.color,
            fontSize: fontSize ?? modifier?.style?.fontSize,
            fontWeight: fontWeight ?? modifier?.style?.fontWeight,
          ),
        );
}

final MTextModifier = MText(modifier: null, data: null);

extension MTextModifierPropertys on MText {
  MText setColor(Color color) {
    return MText(
      modifier: this.modifier,
      data: this.data,
      color: color,
      fontSize: this.style?.fontSize,
      fontWeight: this.style?.fontWeight,
    );
  }

  MText setFontSize(double fontSize) {
    return MText(
      modifier: this.modifier,
      data: this.data,
      color: this.style?.color,
      fontSize: fontSize,
      fontWeight: this.style?.fontWeight,
    );
  }

  MText setFontWeight(FontWeight fontWeight) {
    return MText(
      modifier: this.modifier,
      data: this.data,
      color: this.style?.color,
      fontSize: this.style?.fontSize,
      fontWeight: fontWeight,
    );
  }
}
