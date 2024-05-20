import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';

class MAddButton extends StatelessWidget {
  final DefineMAddButtonModifier? modifier;
  final List<Widget>? children;

  MAddButton({
    this.children,
    this.modifier,
  });

  @override
  Widget build(BuildContext context) {
    return MGeneralLayoutModifierWidget(
      generalModifier: modifier,
      ignoreList: [
        IgnoreModifierInGeneral.width,
        IgnoreModifierInGeneral.height,
        IgnoreModifierInGeneral.backgroundColor,
      ],
      child: Container(
        width: modifier?.valueWidth ?? 86,
        height: modifier?.valueHeight ?? 86,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: modifier?.valueBackgroundColor ?? const Color(0xffF8F8F8),
          borderRadius:
              modifier?.valueBorderRadius ?? BorderRadius.circular(43),
        ),
        child: modifier?.valueImageIcon != null
            ? MImage(
                data: modifier!.valueImageIcon!,
                modifier: MImageModifier.width(modifier?.valueImageWidth)
                    .height(modifier?.valueImageHeight),
              )
            : Icon(CupertinoIcons.add,
                size: modifier?.iconSizeValue ?? 25,
                color: modifier?.iconColorValue ?? const Color(0xff949494)),
      ),
    );
  }
}

final MAddButtonModifier = DefineMAddButtonModifier();

class DefineMAddButtonModifier extends MGeneralModifier {
  final double? iconSizeValue;
  final Color? iconColorValue;
  final String? valueImageIcon;
  final double? valueImageWidth;
  final double? valueImageHeight;

  const DefineMAddButtonModifier({
    this.iconSizeValue,
    this.iconColorValue,
    this.valueImageIcon,
    this.valueImageWidth,
    this.valueImageHeight,
    super.valuePadding,
    super.valueMargin,
    super.valueOnTap,
    super.valueOnLongPress,
    super.valueOnLongPressMoveUpdate,
    super.valueOnLongPressUp,
    super.valueBackgroundColor,
    super.valueBorderRadius,
    super.valueCenterAlign,
    super.valueWidth,
    super.valueHeight,
    super.valueShadow,
    super.valueTransform,
    super.valueConstraints,
    super.valueAspectRatio,
    super.valueFlex,
    super.valueHelp,
    super.valueOpacity,
    super.valueRotate,
    super.valueScale,
    super.valueGradient,
    super.valueBorder,
    super.valueShape,
    super.valueGravity,

    /// Position Widget
    super.valueLeft,
    super.valueRight,
    super.valueTop,
    super.valueBottom,

    // Blur
    super.valueSigmaX,
    super.valueSigmaY,

    /// Material
    super.valueMaterialType,
    super.valueMaterialElevation,
  });

  /// Create a copyWith().
  DefineMAddButtonModifier copyWith({
    double? iconSizeValue,
    Color? iconColorValue,
    String? valueImageIcon,
    double? valueImageWidth,
    double? valueImageHeight,

    /// The following properties are inherited from MGeneralModifier.
    EdgeInsets? valuePadding,
    EdgeInsets? valueMargin,
    GestureTapCallback? valueOnTap,
    GestureLongPressCallback? valueOnLongPress,
    GestureLongPressMoveUpdateCallback? valueOnLongPressMoveUpdate,
    GestureLongPressUpCallback? valueOnLongPressUp,
    Color? valueBackgroundColor,
    BorderRadius? valueBorderRadius,
    bool? valueCenterAlign,
    double? valueWidth,
    double? valueHeight,
    BoxShadow? valueShadow,
    Matrix4? valueTransform,
    BoxConstraints? valueConstraints,
    double? valueAspectRatio,
    int? valueFlex,
    String? valueHelp,
    double? valueOpacity,
    double? valueRotate,
    double? valueScale,
    Gradient? valueGradient,
    Border? valueBorder,
    BoxShape? valueShape,
    MGravity? valueGravity,

    /// Position Widget
    double? valueLeft,
    double? valueRight,
    double? valueTop,
    double? valueBottom,

    /// Blur
    double? valueSigmaX,
    double? valueSigmaY,

    /// Material
    MaterialType? valueMaterialType,
    double? valueMaterialElevation,
  }) {
    return DefineMAddButtonModifier(
      iconSizeValue: iconSizeValue ?? this.iconSizeValue,
      iconColorValue: iconColorValue ?? this.iconColorValue,
      valueImageIcon: valueImageIcon ?? this.valueImageIcon,
      valueImageWidth: valueImageWidth ?? this.valueImageWidth,
      valueImageHeight: valueImageHeight ?? this.valueImageHeight,

      /// The following properties are inherited from MGeneralModifier.
      valuePadding: valuePadding ?? this.valuePadding,
      valueMargin: valueMargin ?? this.valueMargin,
      valueOnTap: valueOnTap ?? this.valueOnTap,
      valueOnLongPress: valueOnLongPress ?? this.valueOnLongPress,
      valueOnLongPressMoveUpdate:
          valueOnLongPressMoveUpdate ?? this.valueOnLongPressMoveUpdate,
      valueOnLongPressUp: valueOnLongPressUp ?? this.valueOnLongPressUp,
      valueBackgroundColor: valueBackgroundColor ?? this.valueBackgroundColor,
      valueBorderRadius: valueBorderRadius ?? this.valueBorderRadius,
      valueCenterAlign: valueCenterAlign ?? this.valueCenterAlign,
      valueWidth: valueWidth ?? this.valueWidth,
      valueHeight: valueHeight ?? this.valueHeight,
      valueShadow: valueShadow ?? this.valueShadow,
      valueTransform: valueTransform ?? this.valueTransform,
      valueConstraints: valueConstraints ?? this.valueConstraints,
      valueAspectRatio: valueAspectRatio ?? this.valueAspectRatio,
      valueFlex: valueFlex ?? this.valueFlex,
      valueHelp: valueHelp ?? this.valueHelp,
      valueOpacity: valueOpacity ?? this.valueOpacity,
      valueRotate: valueRotate ?? this.valueRotate,
      valueScale: valueScale ?? this.valueScale,
      valueGradient: valueGradient ?? this.valueGradient,
      valueBorder: valueBorder ?? this.valueBorder,
      valueShape: valueShape ?? this.valueShape,
      valueGravity: valueGravity ?? this.valueGravity,

      /// Position Widget
      valueLeft: valueLeft ?? this.valueLeft,
      valueRight: valueRight ?? this.valueRight,
      valueTop: valueTop ?? this.valueTop,
      valueBottom: valueBottom ?? this.valueBottom,

      // Blur
      valueSigmaX: valueSigmaX ?? this.valueSigmaX,
      valueSigmaY: valueSigmaY ?? this.valueSigmaY,

      // Material
      valueMaterialType: valueMaterialType ?? this.valueMaterialType,
      valueMaterialElevation:
          valueMaterialElevation ?? this.valueMaterialElevation,
    );
  }
}

extension MAddButtonModifierPropertys on DefineMAddButtonModifier {
  DefineMAddButtonModifier iconSize(double value) {
    return this.copyWith(iconSizeValue: value);
  }

  DefineMAddButtonModifier iconColor(Color value) {
    return this.copyWith(iconColorValue: value);
  }

  DefineMAddButtonModifier imageIcon(String value) {
    return this.copyWith(valueImageIcon: value);
  }

  DefineMAddButtonModifier imageSize(double? value) {
    return this.copyWith(valueImageWidth: value, valueImageHeight: value);
  }

  DefineMAddButtonModifier imageWidth(double? value) {
    return this.copyWith(valueImageWidth: value);
  }

  DefineMAddButtonModifier imageHeight(double? value) {
    return this.copyWith(valueImageHeight: value);
  }
}
