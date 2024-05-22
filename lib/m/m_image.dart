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
    final fitUse = modifier?.valueFit ?? BoxFit.cover;
    // int? cacheWidth = modifier?.valueWidth?.toInt() == null
    //     ? null
    //     : (modifier!.valueWidth!.toInt() * Get.mediaQuery.devicePixelRatio * 2)
    //         .toInt();
    // int? cacheHeight = modifier?.valueHeight?.toInt() == null
    //     ? null
    //     : (modifier!.valueHeight!.toInt() * Get.mediaQuery.devicePixelRatio * 2)
    //         .toInt();
    final useImageWidth = modifier?.valueImageWidth;
    final useImageHeight = modifier?.valueImageHeight;
    Widget imgWidget;
    if (data.startsWith('http')) {
      imgWidget = ExtendedImage.network(
        data,
        width: useImageWidth,
        height: useImageHeight,
        fit: fitUse,
        cache: true,
      );
    } else if (data.startsWith("assets/")) {
      imgWidget = Image.asset(
        data,
        width: useImageWidth,
        height: useImageHeight,
        fit: fitUse,
        // cacheWidth: cacheWidth,
        // cacheHeight: cacheHeight,
      );
    } else if (File(data).existsSync()) {
      imgWidget = Image.file(
        File(data),
        width: useImageWidth,
        height: useImageHeight,
        // cacheWidth: cacheWidth,
        // cacheHeight: cacheHeight,
        fit: fitUse,
      );
    } else {
      imgWidget = Image.memory(
        Uint8List.fromList(data.codeUnits.toList()),
        width: useImageWidth,
        height: useImageHeight,
        fit: fitUse,
        // cacheWidth: cacheWidth,
        // cacheHeight: cacheHeight,
      );
    }

    final containerWidth = modifier?.valueWidth ?? useImageWidth;
    return MGeneralLayoutModifierWidget(
      generalModifier: modifier,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (data.isURL)
            Container(
              width: containerWidth,
              height: modifier?.valueHeight ?? useImageWidth,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: modifier?.valueBorderRadius,
                border: modifier?.valueBorder,
                shape: modifier?.valueShape ?? BoxShape.rectangle,
              ),
            ),
          ClipRRect(
            borderRadius: modifier?.valueShape == BoxShape.circle &&
                    containerWidth != null
                ? BorderRadius.all(Radius.circular((containerWidth) / 2))
                : modifier?.valueBorderRadius ??
                    BorderRadius.all(Radius.circular(0)),
            child: SizedBox(
              width: modifier?.valueWidth,
              height: modifier?.valueHeight,
              child: imgWidget,
            ),
          ),
        ],
      ),
    );
  }
}

final MImageModifier = DefineMImageModifier();

class DefineMImageModifier extends MGeneralModifier {
  final BoxFit? valueFit;
  final double? valueImageWidth;
  final double? valueImageHeight;

  const DefineMImageModifier({
    this.valueFit,
    this.valueImageWidth,
    this.valueImageHeight,
    super.valuePadding,
    super.valueMargin,
    super.valueOnTap,
    super.valueOnLongPress,
    super.valueOnLongPressMoveUpdate,
    super.valueOnLongPressUp,
    super.valueDragOutToStatusBar,
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
    super.valueMaskColor,

    /// Material
    super.valueMaterialType,
    super.valueMaterialElevation,
  });

  DefineMImageModifier copyWith({
    BoxFit? valueFit,
    double? valueImageWidth,
    double? valueImageHeight,

    /// The following properties are inherited from MGeneralModifier.
    EdgeInsets? valuePadding,
    EdgeInsets? valueMargin,
    VoidCallback? valueOnTap,
    GestureLongPressCallback? valueOnLongPress,
    GestureLongPressMoveUpdateCallback? valueOnLongPressMoveUpdate,
    GestureLongPressUpCallback? valueOnLongPressUp,
    VoidCallback? valueDragOutToStatusBar,
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
    MGravity? valueGravity,

    /// Position Widget
    double? valueLeft,
    double? valueRight,
    double? valueTop,
    double? valueBottom,

    /// Blur
    double? valueSigmaX,
    double? valueSigmaY,
    Color? valueMaskColor,

    /// Material
    MaterialType? valueMaterialType,
    double? valueMaterialElevation,
  }) {
    return DefineMImageModifier(
      valueFit: valueFit ?? this.valueFit,
      valueImageWidth: valueImageWidth ?? this.valueImageWidth,
      valueImageHeight: valueImageWidth ?? this.valueImageHeight,

      /// Container
      valuePadding: valuePadding ?? this.valuePadding,
      valueMargin: valueMargin ?? this.valueMargin,
      valueOnTap: valueOnTap ?? this.valueOnTap,
      valueOnLongPress: valueOnLongPress ?? this.valueOnLongPress,
      valueOnLongPressMoveUpdate:
          valueOnLongPressMoveUpdate ?? this.valueOnLongPressMoveUpdate,
      valueOnLongPressUp: valueOnLongPressUp ?? this.valueOnLongPressUp,
      valueDragOutToStatusBar:
          valueDragOutToStatusBar ?? this.valueDragOutToStatusBar,
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
      valueMaskColor: valueMaskColor ?? this.valueMaskColor,

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

  DefineMImageModifier sizeImageSet(Size value) {
    return this
        .copyWith(valueImageWidth: value.width, valueImageHeight: value.height);
  }

  DefineMImageModifier sizeImageAll(double value) {
    return this.copyWith(valueImageWidth: value, valueImageHeight: value);
  }

  DefineMImageModifier sizeImage(double value) {
    return this.copyWith(valueImageWidth: value, valueImageHeight: value);
  }

  DefineMImageModifier widthImage(double? value) {
    return this.copyWith(valueImageWidth: value);
  }

  DefineMImageModifier heightImage(double? value) {
    return this.copyWith(valueImageHeight: value);
  }

  DefineMImageModifier imageSizeSet(Size value) {
    return this
        .copyWith(valueImageWidth: value.width, valueImageHeight: value.height);
  }

  DefineMImageModifier imageSizeAll(double value) {
    return this.copyWith(valueImageWidth: value, valueImageHeight: value);
  }

  DefineMImageModifier imageSize(double value) {
    return this.copyWith(valueImageWidth: value, valueImageHeight: value);
  }

  DefineMImageModifier imageWidth(double? value) {
    return this.copyWith(valueImageWidth: value);
  }

  DefineMImageModifier imageHeight(double? value) {
    return this.copyWith(valueImageHeight: value);
  }
}

ImageProvider mGetImageProvider(String data) {
  ImageProvider imgWidget;
  if (data.startsWith('http')) {
    imgWidget = ExtendedNetworkImageProvider(
      data,
      cache: true,
    );
  } else if (data.startsWith("assets/")) {
    imgWidget = AssetImage(
      data,
      // cacheWidth: cacheWidth,
      // cacheHeight: cacheHeight,
    );
  } else if (File(data).existsSync()) {
    imgWidget = FileImage(
      File(data),
    );
  } else {
    imgWidget = MemoryImage(
      Uint8List.fromList(data.codeUnits.toList()),
      // cacheWidth: cacheWidth,
      // cacheHeight: cacheHeight,
    );
  }
  return imgWidget;
}
