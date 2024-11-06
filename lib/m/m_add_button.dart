import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:flutter_compose_ui_modifiers/util/m_error.dart';
import 'package:get/get.dart';

class MAddButton extends StatefulWidget {
  /// Please do not use DefineMAddButtonModifier, just use `MAddButtonModifier`.
  /// for example:
  /// ```
  /// MAddButton(
  ///  modifier: MAddButtonModifier.color(Colors.red),
  ///  )
  ///  ```
  final DefineMAddButtonModifier? modifier;
  final RxString? value;
  final RxList<String>? images;

  MAddButton({
    this.modifier,
    this.value,
    this.images,
  }) : super(key: modifier?.valueKey ?? null);

  @override
  State<MAddButton> createState() => _MAddButtonState();
}

class _MAddButtonState extends State<MAddButton> {
  @override
  Widget build(BuildContext context) {
    if (widget.modifier?.valueObxListener != null) {
      throw NotSupportObxListenerException();
    }

    final width = widget.modifier?.valueWidth ??
        widget.modifier?.valueImageWidth ??
        86.px;
    final height = widget.modifier?.valueHeight ??
        widget.modifier?.valueImageHeight ??
        86.px;
    final addButton = widget.modifier?.valueImageIcon != null
        ? MImage(
            data: widget.modifier!.valueImageIcon!,
            modifier: MImageModifier.width(widget.modifier?.valueImageWidth)
                .height(widget.modifier?.valueImageHeight),
          )
        : Icon(CupertinoIcons.add,
            size: widget.modifier?.iconSizeValue ?? 25.px,
            color: widget.modifier?.imageColorValue ?? const Color(0xff949494));
    final BorderRadiusGeometry radius =
        widget.modifier?.valueBorderRadius ?? BorderRadius.circular(43.0);
    final double marginCloseTop = widget.modifier?.valueMarginCloseTop ?? 0.px;
    final content = Align(
      alignment: Alignment.topLeft,
      child: MGeneralLayoutModifierWidget(
        // key: modifier?.valueKey ?? key,
        generalModifier: widget.modifier,
        ignoreList: [
          // IgnoreModifierInGeneral.width,
          // IgnoreModifierInGeneral.height,
          IgnoreModifierInGeneral.backgroundColor,
          IgnoreModifierInGeneral.borderRadius,
        ],
        child: Stack(
          children: [
            Container(
              width: width,
              height: height,
              alignment: Alignment.center,
              margin:
                  EdgeInsets.only(top: marginCloseTop, right: marginCloseTop),
              decoration: BoxDecoration(
                color: widget.modifier?.valueBackgroundColor ??
                    const Color(0xffF8F8F8),
                borderRadius: radius,
              ),
              child: widget.value != null
                  ? Obx(() {
                      if (GetUtils.isNullOrBlank(widget.value?.value)!) {
                        return addButton;
                      }
                      return MImage(
                        data: widget.value!.value,
                        modifier: MImageModifier.width(width)
                            .height(height)
                            .imageColor(widget.modifier?.imageColorValue)
                            .borderRadiusSet(radius as BorderRadius),
                      );
                    })
                  : addButton,
            ),
            if (widget.value != null)
              Obx(() {
                if (GetUtils.isNullOrBlank(widget.value!.value)!.not()) {
                  return MImage(
                    data: MConfig.assetImageIcCloseImage,
                    modifier: MImageModifier.sizeImageAll(
                            widget.modifier?.valueCloseButtonSize ?? 18.px)
                        .right(0)
                        .top(0)

                        /// The area we can click.
                        .marginLeft(10.px)

                        /// The area we can click.
                        .marginBottom(10.px)
                        .package('flutter_compose_ui_modifiers')
                        .click(() {
                      if (widget.modifier?.valueClickClose != null) {
                        widget.modifier!.valueClickClose!();
                      } else {
                        widget.value!.value = '';
                      }
                    }),
                  );
                } else {
                  return Container();
                }
              })
          ],
        ),
      ),
    );
    // if (widget.images == null) {
    return content;
    // } else {
    //   final int maxImagesLength = widget.modifier?.valueMaxImagesLength ?? 9;
    //   return SizedBox(
    //     width: Get.width,
    //     child: Obx(
    //           () => Wrap(
    //         spacing: 8.px,
    //         runSpacing: 8.px,
    //         children: List.generate(
    //             widget.images!.length >= maxImagesLength
    //                 ? widget.images!.length
    //                 : widget.images!.length + 1, (index) {
    //           final bool add = widget.images!.length - 1 < index;
    //           return MAddButton(
    //             value: add ? null : widget.images![index].obs,
    //             modifier: MAddButtonModifier.width(90.px).backgroundColor(Colors.blue).radius(8.px).click(() {
    //               if (widget.modifier!.valueOnImage != null) {
    //                 widget.modifier!.valueOnImage!(index);
    //               } else {
    //                 mLogger.d("Click the image but not set the valueOnImage.");
    //               }
    //             }),
    //           );
    //         }),
    //       ),
    //     ),
    //   );
    // }
  }
}

final MAddButtonModifier = DefineMAddButtonModifier();

typedef OnImage = Function(int index);

/// Please do not use it, just use `MAddButtonModifier`.
class DefineMAddButtonModifier extends MGeneralModifier {
  final double? iconSizeValue;
  final Color? imageColorValue;

  final String? valueImageIcon;
  final double? valueImageWidth;
  final double? valueImageHeight;
  final double? valueCloseButtonSize;
  final double? valueMarginCloseTop;
  final VoidCallback? valueClickClose;
  final int? valueMaxImagesLength;
  final OnImage? valueOnImage;

  const DefineMAddButtonModifier({
    this.iconSizeValue,
    this.imageColorValue,
    this.valueImageIcon,
    this.valueImageWidth,
    this.valueImageHeight,
    this.valueCloseButtonSize,
    this.valueMarginCloseTop,
    this.valueClickClose,
    this.valueMaxImagesLength,
    this.valueOnImage,

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
    super.valueCancelFocusWhenClick,
    super.valueOutsideBorder,

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
    super.valueOutsideBorderRadius,
    super.valueHeroTag,
  });

  /// Create a copyWith().
  DefineMAddButtonModifier copyWith({
    double? iconSizeValue,
    Color? imageColorValue,
    String? valueImageIcon,
    double? valueImageWidth,
    double? valueImageHeight,
    double? valueCloseButtonSize,
    double? valueMarginCloseTop,
    VoidCallback? valueClickClose,
    int? valueMaxImagesLength,
    final OnImage? valueOnImage,

    /// The following properties are inherited from MGeneralModifier.
    /// Main.
    Key? valueKey,

    /// Contents:
    EdgeInsets? valuePadding,
    EdgeInsets? valueMargin,
    GestureTapCallback? valueOnTap,
    GestureLongPressCallback? valueOnLongPress,
    GestureLongPressMoveUpdateCallback? valueOnLongPressMoveUpdate,
    GestureLongPressUpCallback? valueOnLongPressUp,
    VoidCallback? valueDragOutToStatusBar,
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
    bool? valueCancelFocusWhenClick,
    Border? valueOutsideBorder,

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
    BorderRadiusGeometry? valueOutsideBorderRadius,
    Object? valueHeroTag,
  }) {
    return DefineMAddButtonModifier(
      iconSizeValue: iconSizeValue ?? this.iconSizeValue,
      imageColorValue: imageColorValue ?? this.imageColorValue,
      valueImageIcon: valueImageIcon ?? this.valueImageIcon,
      valueImageWidth: valueImageWidth ?? this.valueImageWidth,
      valueImageHeight: valueImageHeight ?? this.valueImageHeight,
      valueCloseButtonSize: valueCloseButtonSize ?? this.valueCloseButtonSize,
      valueMarginCloseTop: valueMarginCloseTop ?? this.valueMarginCloseTop,
      valueClickClose: valueClickClose ?? this.valueClickClose,
      valueMaxImagesLength: valueMaxImagesLength ?? this.valueMaxImagesLength,
      valueOnImage: valueOnImage ?? this.valueOnImage,

      /// The following properties are inherited from MGeneralModifier.
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
          valueCancelFocusWhenClick ?? this.valueCancelFocusWhenClick,
      valueOutsideBorder: valueOutsideBorder ?? valueOutsideBorder,

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

extension MAddButtonModifierPropertys on DefineMAddButtonModifier {
  DefineMAddButtonModifier iconSize(double value) {
    return this.copyWith(iconSizeValue: value);
  }

  DefineMAddButtonModifier imageColor(Color value) {
    return this.copyWith(imageColorValue: value);
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

  DefineMAddButtonModifier marginCloseTop(double? value) {
    return this.copyWith(valueMarginCloseTop: value);
  }

  DefineMAddButtonModifier clickClose(VoidCallback? value) {
    return this.copyWith(valueClickClose: value);
  }

  DefineMAddButtonModifier maxImagesLength(int? value) {
    return this.copyWith(valueMaxImagesLength: value);
  }

  DefineMAddButtonModifier onImage(OnImage value) {
    return this.copyWith(valueOnImage: value);
  }

  DefineMAddButtonModifier styleSquareCorner() {
    return this
        .backgroundColor(Colors.grey[200]!)
        .height(40.px)
        .sizeAll(90.px)
        .radius(8.px)
        .marginCloseTop(8.px);
  }
}
