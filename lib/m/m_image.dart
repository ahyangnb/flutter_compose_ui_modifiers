import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:extended_image/extended_image.dart';
import 'package:get/get.dart';

class MImage extends StatelessWidget {
  final DefineMImageModifier? modifier;
  final String data;

  MImage({
    this.modifier,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    // int? cacheWidth = modifier?.valueWidth?.toInt() == null
    //     ? null
    //     : (modifier!.valueWidth!.toInt() * Get.mediaQuery.devicePixelRatio * 2)
    //         .toInt();
    // int? cacheHeight = modifier?.valueHeight?.toInt() == null
    //     ? null
    //     : (modifier!.valueHeight!.toInt() * Get.mediaQuery.devicePixelRatio * 2)
    //         .toInt();
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
        // cacheWidth: cacheWidth,
        // cacheHeight: cacheHeight,
      );
    } else if (File(data).existsSync()) {
      imgWidget = Image.file(
        File(data),
        width: modifier?.valueWidth,
        height: modifier?.valueHeight,
        // cacheWidth: cacheWidth,
        // cacheHeight: cacheHeight,
        fit: modifier?.valueFit,
      );
    } else {
      imgWidget = Image.memory(
        Uint8List.fromList(data.codeUnits.toList()),
        width: modifier?.valueWidth,
        height: modifier?.valueHeight,
        fit: modifier?.valueFit,
        // cacheWidth: cacheWidth,
        // cacheHeight: cacheHeight,
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
          if (data.isURL)
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
          ClipRRect(
            borderRadius: modifier?.valueShape == BoxShape.circle &&
                    modifier?.valueWidth != null
                ? BorderRadius.all(Radius.circular((modifier!.valueWidth!) / 2))
                : modifier?.valueBorderRadius ??
                    BorderRadius.all(Radius.circular(0)),
            child: imgWidget,
          ),
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
    super.valueOutSideCenter,

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

  DefineMImageModifier copyWith({
    BoxFit? valueFit,

    /// The following properties are inherited from MGeneralModifier.
    EdgeInsets? valuePadding,
    EdgeInsets? valueMargin,
    VoidCallback? valueOnTap,
    GestureLongPressCallback? valueOnLongPress,
    GestureLongPressMoveUpdateCallback? valueOnLongPressMoveUpdate,
    GestureLongPressUpCallback? valueOnLongPressUp,
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
    bool? valueOutSideCenter,

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
    return DefineMImageModifier(
      valueFit: valueFit ?? this.valueFit,

      /// Container
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
      valueOutSideCenter: valueOutSideCenter ?? this.valueOutSideCenter,

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

extension MImageModifierPropertys on DefineMImageModifier {
  DefineMImageModifier fit(BoxFit value) {
    return this.copyWith(valueFit: value);
  }

  DefineMImageModifier avatar({
    double? size,
    double? radius,
  }) {
    final radiusUse =
        radius ?? (this.valueBorderRadius as BorderRadius?)?.topLeft.x;
    return this.copyWith(
      valueWidth: size,
      valueHeight: size,
      valueBorderRadius: BorderRadius.circular(radiusUse ??
          (size ?? math.max(this.valueWidth ?? 0, this.valueHeight ?? 0)) / 2),
    );
  }
}
