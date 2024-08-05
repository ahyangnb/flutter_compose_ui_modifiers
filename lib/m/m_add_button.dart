import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:flutter_compose_ui_modifiers/util/m_error.dart';
import 'package:get/get.dart';

class MAddButton extends StatelessWidget {
  /// Please do not use DefineMAddButtonModifier, just use `MAddButtonModifier`.
  /// for example:
  /// ```
  /// MAddButton(
  ///  modifier: MAddButtonModifier.color(Colors.red),
  ///  )
  ///  ```
  final DefineMAddButtonModifier? modifier;
  final RxString? value;

  MAddButton({
    this.modifier,
    this.value,
  }) : super(key: modifier?.valueKey ?? null);

  @override
  Widget build(BuildContext context) {
    if (modifier?.valueObxListener != null) {
      throw NotSupportObxListenerException();
    }

    final width = modifier?.valueWidth ?? modifier?.valueImageWidth ?? 86.px;
    final height = modifier?.valueHeight ?? modifier?.valueImageHeight ?? 86.px;
    final addButton = Icon(CupertinoIcons.add,
        size: modifier?.iconSizeValue ?? 25.px,
        color: modifier?.imageColorValue ?? const Color(0xff949494));
    final BorderRadiusGeometry radius =
        modifier?.valueBorderRadius ?? BorderRadius.circular(43.0);
    final double marginCloseTop = modifier?.valueMarginCloseTop ?? 0.px;
    return Align(
      alignment: Alignment.topLeft,
      child: MGeneralLayoutModifierWidget(
        // key: modifier?.valueKey ?? key,
        generalModifier: modifier,
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
                color:
                    modifier?.valueBackgroundColor ?? const Color(0xffF8F8F8),
                borderRadius: radius,
              ),
              child: value != null
                  ? Obx(() {
                      if (GetUtils.isNullOrBlank(value?.value)!) {
                        return addButton;
                      }
                      return MImage(
                        data: value!.value,
                        modifier: MImageModifier.width(width)
                            .height(height)
                            .imageColor(modifier?.imageColorValue)
                            .borderRadiusSet(radius as BorderRadius),
                      );
                    })
                  : addButton,
            ),
            if (value != null)
              Obx(() {
                if (GetUtils.isNullOrBlank(value!.value)!.not()) {
                  return MImage(
                    data: 'assets/images/ic_close_image.png',
                    modifier: MImageModifier.sizeImageAll(
                            modifier?.valueCloseButtonSize ?? 18.px)
                        .right(0)
                        .top(0)

                        /// The area we can click.
                        .marginLeft(10.px)

                        /// The area we can click.
                        .marginBottom(10.px)
                        .package('flutter_compose_ui_modifiers')
                        .click(() {
                      if (modifier?.valueClickClose != null) {
                        modifier!.valueClickClose!();
                      } else {
                        value!.value = '';
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
  }
}

final MAddButtonModifier = DefineMAddButtonModifier();

/// Please do not use it, just use `MAddButtonModifier`.
class DefineMAddButtonModifier extends MGeneralModifier {
  final double? iconSizeValue;
  final Color? imageColorValue;

  // final String? valueImageIcon;
  final double? valueImageWidth;
  final double? valueImageHeight;
  final double? valueCloseButtonSize;
  final double? valueMarginCloseTop;
  final VoidCallback? valueClickClose;

  const DefineMAddButtonModifier({
    this.iconSizeValue,
    this.imageColorValue,
    // this.valueImageIcon,
    this.valueImageWidth,
    this.valueImageHeight,
    this.valueCloseButtonSize,
    this.valueMarginCloseTop,
    this.valueClickClose,

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
    super.valueObxListener,
  });

  /// Create a copyWith().
  DefineMAddButtonModifier copyWith({
    double? iconSizeValue,
    Color? imageColorValue,
    // String? valueImageIcon,
    double? valueImageWidth,
    double? valueImageHeight,
    double? valueCloseButtonSize,
    double? valueMarginCloseTop,
    VoidCallback? valueClickClose,

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
    Rx<dynamic>? valueObxListener,
  }) {
    return DefineMAddButtonModifier(
      iconSizeValue: iconSizeValue ?? this.iconSizeValue,
      imageColorValue: imageColorValue ?? this.imageColorValue,
      // valueImageIcon: valueImageIcon ?? this.valueImageIcon,
      valueImageWidth: valueImageWidth ?? this.valueImageWidth,
      valueImageHeight: valueImageHeight ?? this.valueImageHeight,
      valueCloseButtonSize: valueCloseButtonSize ?? this.valueCloseButtonSize,
      valueMarginCloseTop: valueMarginCloseTop ?? this.valueMarginCloseTop,
      valueClickClose: valueClickClose ?? this.valueClickClose,

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
      valueObxListener: valueObxListener ?? this.valueObxListener,
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

  // DefineMAddButtonModifier imageIcon(String value) {
  //   return this.copyWith(valueImageIcon: value);
  // }

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

  DefineMAddButtonModifier styleSquareCorner() {
    return this
        .backgroundColor(Colors.grey[200]!)
        .height(40.px)
        .sizeAll(90.px)
        .radius(8.px)
        .marginCloseTop(8.px);
  }
}
