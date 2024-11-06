import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:flutter_compose_ui_modifiers/util/log.dart';
import 'package:flutter_compose_ui_modifiers/util/m_error.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MImage extends StatefulWidget {
  /// Please do not use DefineMImageModifier, just use `MImageModifier`.
  /// for example:
  /// ```
  /// MImage(
  ///  modifier: MImageModifier.color(Colors.red),
  ///  data: "",
  ///  )
  ///  ```
  final DefineMImageModifier? modifier;
  final String? data;
  final String Function()? builder;

  MImage({
    this.modifier,
    this.data,
    this.builder,
  }) : super(key: modifier?.valueKey ?? null);

  @override
  State<MImage> createState() => _MImageState();
}

class _MImageState extends ModifierState<MImage> with ObxImplementation {
  @override
  Widget build(BuildContext context) {
    if (widget.builder == null && widget.modifier?.valueObxListener != null) {
      throw MustSetBuilderException();
    }
    if (widget.builder != null && widget.data != null) {
      throw OnlyBuilderException("data");
    }

    final useData =
        widget.builder != null ? widget.builder!() : widget.data ?? "";
    final fitUse = widget.modifier?.valueFit ?? BoxFit.cover;
    // int? cacheWidth = modifier?.valueWidth?.toInt() == null
    //     ? null
    //     : (modifier!.valueWidth!.toInt() * Get.mediaQuery.devicePixelRatio * 2)
    //         .toInt();
    // int? cacheHeight = modifier?.valueHeight?.toInt() == null
    //     ? null
    //     : (modifier!.valueHeight!.toInt() * Get.mediaQuery.devicePixelRatio * 2)
    //         .toInt();
    final useImageWidth = widget.modifier?.valueImageWidth;
    final useImageHeight = widget.modifier?.valueImageHeight;
    Widget imgWidget;

    final imgError = widget.modifier?.valueImageWhenErrorWidget ??
        (widget.modifier?.valueImgError != null
            ? MAssetsImage(widget.modifier!.valueImgError!,
                fit: widget.modifier?.valueImgErrorFit)
            : MImgError(fit: widget.modifier?.valueImgErrorFit));
    final bool isAssets = useData.startsWith("assets/");
    try {
      if (GetUtils.isNullOrBlank(useData)!) {
        imgWidget = imgError;
      } else if (useData.startsWith('http')) {
        final imgLoading = widget.modifier?.valueImageWhenLoadingWidget ??
            (widget.modifier?.valueImgLoading != null
                ? MAssetsImage(widget.modifier!.valueImgLoading!,
                    fit: widget.modifier?.valueImgLoadingFit)
                : MImgLoading(fit: widget.modifier?.valueImgErrorFit));
        imgWidget = CachedNetworkImage(
          imageUrl: useData,
          width: useImageWidth,
          height: useImageHeight,
          fit: fitUse,
          errorWidget: (BuildContext context, String url, Object error) =>
              imgError,
          placeholder: (BuildContext context, String url) => imgLoading,
          color: widget.modifier?.valueImageColor,
        );
        // imgWidget = ExtendedImage.network(
        //   data,
        //   width: useImageWidth,
        //   height: useImageHeight,
        //   fit: fitUse,
        //   cache: true,
        // );
      } else if (isAssets && useData.endsWith(".svg")) {
        imgWidget = SvgPicture.asset(
          useData,
          width: useImageWidth,
          height: useImageHeight,
          fit: fitUse,
          // errorBuilder:
          //     (BuildContext context, Object error, StackTrace? stackTrace) =>
          //         imgError,
          // cacheWidth: cacheWidth,
          // cacheHeight: cacheHeight,
          package: widget.modifier?.valuePackage,
          color: widget.modifier?.valueImageColor,
        );
      } else if (isAssets) {
        imgWidget = MAssetsImage(
          useData,
          width: useImageWidth,
          height: useImageHeight,
          fit: fitUse,
          errorBuilder:
              (BuildContext context, Object error, StackTrace? stackTrace) =>
                  imgError,
          // cacheWidth: cacheWidth,
          // cacheHeight: cacheHeight,
          package: widget.modifier?.valuePackage,
          color: widget.modifier?.valueImageColor,
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
          color: widget.modifier?.valueImageColor,
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
          color: widget.modifier?.valueImageColor,
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

    final containerWidth = widget.modifier?.valueWidth ?? useImageWidth;
    return MGeneralLayoutModifierWidget(
      generalModifier: widget.modifier,
      // key: modifier?.valueKey ?? key,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (useData.isURL)
            Container(
              width: containerWidth,
              height: widget.modifier?.valueHeight ?? useImageWidth,
              decoration: BoxDecoration(
                color: widget.modifier?.valueImageBackgroundColor ??
                    MThemeConfig.imageDefBgColor,
                borderRadius: widget.modifier?.valueBorderRadius,
                border: widget.modifier?.valueBorder,
                shape: widget.modifier?.valueShape ?? BoxShape.rectangle,
              ),
            ),
          ClipRRect(
            borderRadius: widget.modifier?.valueShape == BoxShape.circle &&
                    containerWidth != null
                ? BorderRadius.all(Radius.circular((containerWidth) / 2))
                : widget.modifier?.valueBorderRadius ??
                    BorderRadius.all(Radius.circular(0)),
            child: SizedBox(
              width: widget.modifier?.valueImageWidth == null
                  ? widget.modifier?.valueWidth
                  : null,
              height: widget.modifier?.valueImageHeight == null
                  ? widget.modifier?.valueHeight
                  : null,
              child: imgWidget,
            ),
          ),
        ],
      ),
    );
  }

  @override
  RxInterface? get valueObxListener => widget.modifier?.valueObxListener;
}

final MImageModifier = DefineMImageModifier();

class MAssetsImage extends StatelessWidget {
  final String useData;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final ImageErrorWidgetBuilder? errorBuilder;
  final String? package;
  final Color? color;

  const MAssetsImage(this.useData,
      {this.width,
      this.height,
      this.fit,
      this.errorBuilder,
      this.package,
      this.color,
      super.key});

  @override
  Widget build(BuildContext context) {
    Widget imgWidget;
    final assetsImage = Image.asset(
      useData,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: errorBuilder,
      // cacheWidth: cacheWidth,
      // cacheHeight: cacheHeight,
      package: package,
      color: color,
    );
    if (MConfig.customAssetsImage != null) {
      //&& package != MConfig.packageName
      imgWidget = MConfig.customAssetsImage!(assetsImage);
    } else {
      imgWidget = assetsImage;
    }
    return imgWidget;
  }
}

/// Please do not use it, just use `MImageModifier`.
class DefineMImageModifier extends MGeneralModifier {
  final BoxFit? valueFit;
  final double? valueImageWidth;
  final double? valueImageHeight;
  final Color? valueImageColor;
  final Color? valueImageBackgroundColor;
  final String? valueImgError;
  final BoxFit? valueImgErrorFit;
  final String? valueImgLoading;
  final BoxFit? valueImgLoadingFit;
  final Widget? valueImageWhenErrorWidget;
  final Widget? valueImageWhenLoadingWidget;
  final String? valuePackage;

  const DefineMImageModifier({
    this.valueFit,
    this.valueImageWidth,
    this.valueImageHeight,
    this.valueImageColor,
    this.valueImageBackgroundColor,
    this.valueImgError,
    this.valueImgErrorFit,
    this.valueImgLoading,
    this.valueImgLoadingFit,
    this.valueImageWhenErrorWidget,
    this.valueImageWhenLoadingWidget,
    this.valuePackage,

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
    super.valueOutSizeFlex,
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
    super.valueOutSideAlignment,
    super.valueCancelFocusWhenClick, super.valueOutsideBorder,

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
    super.valueTabLength,
    super.valueObxListener,
    super.valueOutsideBackgroundColor,
    super.valueOutsideBorderRadius, super.valueHeroTag,
  });

  DefineMImageModifier copyWith({
    BoxFit? valueFit,
    double? valueImageWidth,
    double? valueImageHeight,
    Color? valueImageColor,
    Color? valueImageBackgroundColor,
    String? valueImgError,
    BoxFit? valueImgErrorFit,
    String? valueImgLoading,
    BoxFit? valueImgLoadingFit,
    Widget? valueImageWhenErrorWidget,
    Widget? valueImageWhenLoadingWidget,
    String? valuePackage,

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
    bool? valueOutSizeFlex,
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
    AlignmentGeometry? valueOutSideAlignment,
    bool? valueCancelFocusWhenClick, Border? valueOutsideBorder,

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
    int? valueTabLength,
    RxInterface? valueObxListener,
    Color? valueOutsideBackgroundColor,
    BorderRadiusGeometry? valueOutsideBorderRadius, Object? valueHeroTag,
  }) {
    return DefineMImageModifier(
      valueFit: valueFit ?? this.valueFit,
      valueImageWidth: valueImageWidth ?? this.valueImageWidth,
      valueImageHeight: valueImageWidth ?? this.valueImageHeight,
      valueImageColor: valueImageColor ?? this.valueImageColor,
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
      valuePackage: valuePackage ?? this.valuePackage,

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
      valueOutSizeFlex: valueOutSizeFlex ?? this.valueOutSizeFlex,
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
      valueOutSideAlignment:
          valueOutSideAlignment ?? this.valueOutSideAlignment,
      valueCancelFocusWhenClick:
          valueCancelFocusWhenClick ?? this.valueCancelFocusWhenClick,valueOutsideBorder:
          valueOutsideBorder ?? valueOutsideBorder,

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
      valueTabLength: valueTabLength ?? this.valueTabLength,
      valueObxListener: valueObxListener ?? this.valueObxListener,
      valueOutsideBackgroundColor:
          valueOutsideBackgroundColor ?? this.valueOutsideBackgroundColor,
      valueOutsideBorderRadius:
          valueOutsideBorderRadius ?? this.valueOutsideBorderRadius, valueHeroTag: valueHeroTag ?? this.valueHeroTag,
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
      valueFit: BoxFit.cover,
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

  DefineMImageModifier imageColor(Color? value) {
    return this.copyWith(valueImageColor: value);
  }

  DefineMImageModifier imgColor(Color? value) {
    return this.copyWith(valueImageColor: value);
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

  DefineMImageModifier package(String? value) {
    return this.copyWith(valuePackage: value);
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
    return MAssetsImage(MConfig.assetImageWhenError!, fit: fit);
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
    return MAssetsImage(MConfig.assetImageWhenLoading!, fit: fit);
  }
}
