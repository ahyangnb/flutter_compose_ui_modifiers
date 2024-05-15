import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:extended_image/extended_image.dart';

class MImage extends StatelessWidget {
  final DefineMImageModifier? modifier;
  final String data;

  MImage({
    this.modifier,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    Widget imgWidget;
    if (data.startsWith('http')) {
      imgWidget = ExtendedImage.network(
        data,
        width: modifier?.valueWidth,
        height: modifier?.valueHeight,
        fit: modifier?.valueFit,
        cache: true,
      );
    } else if (data.startsWith("assets/")) {
      imgWidget = Image.asset(
        data,
        width: modifier?.valueWidth,
        height: modifier?.valueHeight,
        fit: modifier?.valueFit,
        cacheWidth: modifier?.valueWidth?.toInt(),
        cacheHeight: modifier?.valueHeight?.toInt(),
      );
    } else if (File(data).existsSync()) {
      imgWidget = Image.file(
        File(data),
        width: modifier?.valueWidth,
        height: modifier?.valueHeight,
        cacheWidth: modifier?.valueWidth?.toInt(),
        cacheHeight: modifier?.valueHeight?.toInt(),
        fit: modifier?.valueFit,
      );
    } else {
      imgWidget = Image.memory(
        Uint8List.fromList(data.codeUnits.toList()),
        width: modifier?.valueWidth,
        height: modifier?.valueHeight,
        fit: modifier?.valueFit,
        cacheWidth: modifier?.valueWidth?.toInt(),
        cacheHeight: modifier?.valueHeight?.toInt(),
      );
    }
    if (modifier?.valueBorderRadius != null) {
      imgWidget = ClipRRect(
        borderRadius: modifier!.valueBorderRadius!,
        child: imgWidget,
      );
    }

    return MGeneralLayoutModifierWidget(
      generalModifier: modifier,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: modifier?.valueWidth,
            height: modifier?.valueHeight,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: modifier?.valueBorderRadius,
              border: modifier?.valueBorder,
              shape: modifier?.valueShape ?? BoxShape.rectangle,
            ),
          ),
          imgWidget,
        ],
      ),
    );
  }
}

final MImageModifier = DefineMImageModifier();

class DefineMImageModifier extends MGeneralModifier {
  final BoxFit? valueFit;

  const DefineMImageModifier({
    this.valueFit,
    super.valuePadding,
    super.valueMargin,
    super.valueOnTap,
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

    /// Position Widget
    super.valueLeft,
    super.valueRight,
    super.valueTop,
    super.valueBottom,
  });

  DefineMImageModifier copyWith({
    BoxFit? valueFit,

    /// The following properties are inherited from MGeneralModifier.
    EdgeInsets? valuePadding,
    EdgeInsets? valueMargin,
    VoidCallback? valueOnTap,
    Color? valueBackgroundColor,
    BorderRadiusGeometry? valueBorderRadius,
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

    /// Position Widget
    double? valueLeft,
    double? valueRight,
    double? valueTop,
    double? valueBottom,
  }) {
    return DefineMImageModifier(
      valueFit: valueFit ?? this.valueFit,

      /// Container
      valuePadding: valuePadding ?? this.valuePadding,
      valueMargin: valueMargin ?? this.valueMargin,
      valueOnTap: valueOnTap ?? this.valueOnTap,
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

      /// Position Widget
      valueLeft: valueLeft ?? this.valueLeft,
      valueRight: valueRight ?? this.valueRight,
      valueTop: valueTop ?? this.valueTop,
      valueBottom: valueBottom ?? this.valueBottom,
    );
  }
}

extension MImageModifierPropertys on DefineMImageModifier {
  DefineMImageModifier fit(BoxFit value) {
    return this.copyWith(valueFit: value);
  }
}
