import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';

class MText extends StatelessWidget {
  final MText? modifier;
  final String? data;
  final MGeneralModifier? generalModifier;
  final TextStyle? style;

  MText({
    this.modifier,
    this.data,
    this.generalModifier,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return MGeneralLayoutModifierWidget(
      generalModifier: generalModifier ?? modifier?.generalModifier,
      child: Text(
        data ?? '',
        style: TextStyle(
          color: style?.color ?? modifier?.style?.color,
          fontSize: style?.fontSize ?? modifier?.style?.fontSize,
          fontWeight: style?.fontWeight ?? modifier?.style?.fontWeight,
        ),
      ),
    );
  }

  /// Create a copyWith().
  MText copyWith({
    MText? modifier,
    String? data,
    MGeneralModifier? generalModifier,
    TextStyle? style,
  }) {
    return MText(
      modifier: modifier ?? this.modifier,
      data: data ?? this.data,
      generalModifier: generalModifier ?? this.generalModifier,
      style: style ?? this.style,
    );
  }
}

final MTextModifier = MText(modifier: null, data: null);

class MTextModifierDefine extends MGeneralModifier{


}

extension MTextModifierPropertys on MText {
  MText onClick(VoidCallback onTap) {
    final thisGeneralModifier = this.generalModifier ??
        this.modifier?.generalModifier ??
        MGeneralModifier();
    print("generalModifier::new::onClick::${onTap}");
    print("thisGeneralModifier::${thisGeneralModifier}");
    final newGeneralModifier = thisGeneralModifier?.copyWith(onTap: onTap);
    print("newGeneralModifier::$newGeneralModifier");
    // return merge(MText(generalModifier: MGeneralModifier(onTap: onTap)));
    final valueAfterCopyWith = copyWith(
        generalModifier: newGeneralModifier,
        modifier: this.modifier?.copyWith(generalModifier: newGeneralModifier));
    print(
        "valueAfterCopyWith.generalModifier::${valueAfterCopyWith.generalModifier}");
    return valueAfterCopyWith;
  }

  MText setColor(Color color) {
    return merge(
        MText(style: (this.style ?? TextStyle()).copyWith(color: color)));
  }

  MText setFontSize(double fontSize) {
    return merge(
        MText(style: (this.style ?? TextStyle()).copyWith(fontSize: fontSize)));
  }

  MText setFontWeight(FontWeight fontWeight) {
    return merge(MText(
        style: (this.style ?? TextStyle()).copyWith(fontWeight: fontWeight)));
  }

  MText merge(MText modifier) {
    final result = MText(
      modifier: modifier.modifier ?? this.modifier,
      generalModifier: modifier.generalModifier ?? this.generalModifier,
      data: modifier.data ?? this.data,
      style: TextStyle(
        color: modifier.style?.color ?? this.style?.color,
        fontSize: modifier.style?.fontSize ?? this.style?.fontSize,
        fontWeight: modifier.style?.fontWeight ?? this.style?.fontWeight,
      ),
    );
    print("new modifier.generalModifier::${modifier.generalModifier}");
    print(
        "After merge ${result.generalModifier}, the modifier is ${modifier.style.toString()}, ${result.modifier.toString()}");
    return result;
  }
}
