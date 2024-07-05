import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:flutter_compose_ui_modifiers/util/log.dart';
import 'package:get/get.dart';

class MImage extends StatelessWidget {
  final DefineMImageModifier? modifier;
  final String? data;

  MImage({
    this.modifier,
    required this.data,
  }) : super(key: modifier?.valueKey ?? null);

  @override
  Widget build(BuildContext context) {
    final useData = data ?? "";
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

    final imgError = modifier?.valueImageWhenErrorWidget ??
        (modifier?.valueImgError != null
            ? Image.asset(modifier!.valueImgError!,
                fit: modifier?.valueImgErrorFit)
            : MImgError(fit: modifier?.valueImgErrorFit));
    try {
      if (GetUtils.isNullOrBlank(useData)!) {
        imgWidget = imgError;
      } else if (useData.startsWith('http')) {
        final imgLoading = modifier?.valueImageWhenLoadingWidget ??
            (modifier?.valueImgLoading != null
                ? Image.asset(modifier!.valueImgLoading!,
                    fit: modifier?.valueImgLoadingFit)
                : MImgLoading(fit: modifier?.valueImgErrorFit));
        imgWidget = CachedNetworkImage(
          imageUrl: useData,
          width: useImageWidth,
          height: useImageHeight,
          fit: fitUse,
          errorWidget: (BuildContext context, String url, Object error) =>
              imgError,
          placeholder: (BuildContext context, String url) => imgLoading,
        );
        // imgWidget = ExtendedImage.network(
        //   data,
        //   width: useImageWidth,
        //   height: useImageHeight,
        //   fit: fitUse,
        //   cache: true,
        // );
      } else if (useData.startsWith("assets/")) {
        imgWidget = Image.asset(
          useData,
          width: useImageWidth,
          height: useImageHeight,
          fit: fitUse,
          errorBuilder:
              (BuildContext context, Object error, StackTrace? stackTrace) =>
                  imgError,
          // cacheWidth: cacheWidth,
          // cacheHeight: cacheHeight,
        );
      } else if (File(useData).existsSync()) {
        imgWidget = Image.file(
          File(useData),
          width: useImageWidth,
          height: useImageHeight,
          // cacheWidth: cacheWidth,
          // cacheHeight: cacheHeight,
          fit: fitUse,
          errorBuilder:
              (BuildContext context, Object error, StackTrace? stackTrace) =>
                  imgError,
        );
      } else {
        imgWidget = Image.memory(
          base64Decode(useData),
          // Uint8List.fromList(data.codeUnits.toList()),
          width: useImageWidth,
          height: useImageHeight,
          fit: fitUse,
          // cacheWidth: cacheWidth,
          // cacheHeight: cacheHeight,

          errorBuilder:
              (BuildContext context, Object error, StackTrace? stackTrace) =>
                  imgError,
        );
      }
    } catch (e, s) {
      mLogger.e("MImage::ERROR::${e.toString()}", error: e, stackTrace: s);
      imgWidget = Container(
        width: useImageWidth,
        height: useImageHeight,
        child: imgError,
      );
    }

    final containerWidth = modifier?.valueWidth ?? useImageWidth;
    return MGeneralLayoutModifierWidget(
      generalModifier: modifier,
      // key: modifier?.valueKey ?? key,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (useData.isURL)
            Container(
              width: containerWidth,
              height: modifier?.valueHeight ?? useImageWidth,
              decoration: BoxDecoration(
                color: modifier?.valueImageBackgroundColor ??
                    MConfig.imageDefBgColor,
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
              width: modifier?.valueImageWidth == null
                  ? modifier?.valueWidth
                  : null,
              height: modifier?.valueImageHeight == null
                  ? modifier?.valueHeight
                  : null,
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
  final Color? valueImageBackgroundColor;
  final String? valueImgError;
  final BoxFit? valueImgErrorFit;
  final String? valueImgLoading;
  final BoxFit? valueImgLoadingFit;
  final Widget? valueImageWhenErrorWidget;
  final Widget? valueImageWhenLoadingWidget;

  const DefineMImageModifier({
    this.valueFit,
    this.valueImageWidth,
    this.valueImageHeight,
    this.valueImageBackgroundColor,
    this.valueImgError,
    this.valueImgErrorFit,
    this.valueImgLoading,
    this.valueImgLoadingFit,
    this.valueImageWhenErrorWidget,
    this.valueImageWhenLoadingWidget,

    /// Main.
    super.valueKey,

    /// Contents:
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
    super.valueBackgroundImage,
    super.valueBackgroundImageFit,
    super.valueGravity,
    super.valueGradientBorder,
    super.valueGradientBorderSize,
    super.valueFullWidth,
    super.valueFullHeight,
    super.valueContainerAlignment,

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

    /// Other
    super.valueScrollable,
    super.valueScrollController,
    super.valueSafeArea,
    super.valueVisible,
  });

  DefineMImageModifier copyWith({
    BoxFit? valueFit,
    double? valueImageWidth,
    double? valueImageHeight,
    Color? valueImageBackgroundColor,
    String? valueImgError,
    BoxFit? valueImgErrorFit,
    String? valueImgLoading,
    BoxFit? valueImgLoadingFit,
    Widget? valueImageWhenErrorWidget,
    Widget? valueImageWhenLoadingWidget,

    /// The following properties are inherited from MGeneralModifier.
    /// Main.
    Key? valueKey,

    /// Contents:
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
    String? valueBackgroundImage,
    BoxFit? valueBackgroundImageFit,
    MGravity? valueGravity,
    Gradient? valueGradientBorder,
    double? valueFullWidth,
    double? valueFullHeight,
    AlignmentGeometry? valueContainerAlignment,

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

    /// Other
    bool? valueScrollable,
    ScrollController? valueScrollController,
    SafeArea? valueSafeArea,
    bool? valueVisible,
  }) {
    return DefineMImageModifier(
      valueFit: valueFit ?? this.valueFit,
      valueImageWidth: valueImageWidth ?? this.valueImageWidth,
      valueImageHeight: valueImageWidth ?? this.valueImageHeight,
      valueImageBackgroundColor:
          valueImageBackgroundColor ?? this.valueImageBackgroundColor,
      valueImgError: valueImgError ?? this.valueImgError,
      valueImgErrorFit: valueImgErrorFit ?? this.valueImgErrorFit,
      valueImgLoading: valueImgLoading ?? this.valueImgLoading,
      valueImgLoadingFit: valueImgLoadingFit ?? this.valueImgLoadingFit,
      valueImageWhenErrorWidget:
          valueImageWhenErrorWidget ?? this.valueImageWhenErrorWidget,
      valueImageWhenLoadingWidget:
          valueImageWhenLoadingWidget ?? this.valueImageWhenLoadingWidget,

      /// Main.
      valueKey: valueKey ?? this.valueKey,

      /// Contents:
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
      valueBackgroundImage: valueBackgroundImage ?? this.valueBackgroundImage,
      valueBackgroundImageFit:
          valueBackgroundImageFit ?? this.valueBackgroundImageFit,
      valueGravity: valueGravity ?? this.valueGravity,
      valueGradientBorder: valueGradientBorder ?? this.valueGradientBorder,
      valueFullWidth: valueFullWidth ?? this.valueFullWidth,
      valueFullHeight: valueFullHeight ?? this.valueFullHeight,
      valueContainerAlignment:
          valueContainerAlignment ?? this.valueContainerAlignment,

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

      // Other
      valueScrollable: valueScrollable ?? this.valueScrollable,
      valueScrollController:
          valueScrollController ?? this.valueScrollController,
      valueSafeArea: valueSafeArea ?? this.valueSafeArea,
      valueVisible: valueVisible ?? this.valueVisible,
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

  DefineMImageModifier sizeImgAll(double value) {
    return this.copyWith(valueImageWidth: value, valueImageHeight: value);
  }

  DefineMImageModifier sizeImage(double valueWidth, double valueHeight) {
    return this
        .copyWith(valueImageWidth: valueWidth, valueImageHeight: valueHeight);
  }

  DefineMImageModifier sizeImg(double valueWidth, double valueHeight) {
    return this
        .copyWith(valueImageWidth: valueWidth, valueImageHeight: valueHeight);
  }

  DefineMImageModifier allSizeImage(double value) {
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

  DefineMImageModifier imageSize(
      double valueImageWidth, double valueImageHeight) {
    return this.copyWith(
        valueImageWidth: valueImageWidth, valueImageHeight: valueImageHeight);
  }

  DefineMImageModifier imageWidth(double? value) {
    return this.copyWith(valueImageWidth: value);
  }

  DefineMImageModifier imageHeight(double? value) {
    return this.copyWith(valueImageHeight: value);
  }

  DefineMImageModifier imageBackgroundColor(Color? value) {
    return this.copyWith(valueImageBackgroundColor: value);
  }

  DefineMImageModifier imgBgColor(Color? value) {
    return this.copyWith(valueImageBackgroundColor: value);
  }

  /// Assets path value.
  DefineMImageModifier imageError(String? value) {
    return this.copyWith(valueImgError: value);
  }

  DefineMImageModifier imageErrorFit(BoxFit? value) {
    return this.copyWith(valueImgErrorFit: value);
  }

  /// Assets path value.
  DefineMImageModifier imageLoading(String? value) {
    return this.copyWith(valueImgLoading: value);
  }

  DefineMImageModifier imageLoadingFit(BoxFit? value) {
    return this.copyWith(valueImgLoadingFit: value);
  }

  DefineMImageModifier imageWhenErrorWidget(Widget? value) {
    return this.copyWith(valueImageWhenErrorWidget: value);
  }

  DefineMImageModifier imageWhenLoadingWidget(Widget? value) {
    return this.copyWith(valueImageWhenLoadingWidget: value);
  }
}

ImageProvider mGetImageProvider(String data) {
  ImageProvider imgWidget;
  try {
    if (GetUtils.isNullOrBlank(data)!) {
      imgWidget = AssetImage(
        MConfig.assetImageWhenError ?? "",
        // cacheWidth: cacheWidth,
        // cacheHeight: cacheHeight,
      );
    } else if (data.startsWith('http')) {
      imgWidget = CachedNetworkImageProvider(data);
      // imgWidget = ExtendedNetworkImageProvider(
      //   data,
      //   cache: true,
      // );
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
        base64Decode(data),
        // Uint8List.fromList(data.codeUnits.toList()),
        // cacheWidth: cacheWidth,
        // cacheHeight: cacheHeight,
      );
    }
  } catch (e) {
    imgWidget = AssetImage(
      MConfig.assetImageWhenError ?? "",
      // cacheWidth: cacheWidth,
      // cacheHeight: cacheHeight,
    );
  }
  return imgWidget;
}

class MImgError extends StatelessWidget {
  final BoxFit? fit;

  const MImgError({this.fit, super.key});

  @override
  Widget build(BuildContext context) {
    if (GetUtils.isNullOrBlank(MConfig.assetImageWhenError)!) {
      return Icon(Icons.error);
    }
    return Image.asset(MConfig.assetImageWhenError!, fit: fit);
  }
}

class MImgLoading extends StatelessWidget {
  final BoxFit? fit;

  const MImgLoading({this.fit, super.key});

  @override
  Widget build(BuildContext context) {
    if (GetUtils.isNullOrBlank(MConfig.assetImageWhenLoading)!) {
      return Container();
    }
    return Image.asset(MConfig.assetImageWhenLoading!, fit: fit);
  }
}
