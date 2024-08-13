import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:flutter_compose_ui_modifiers/other/m_reverse.dart';
import 'package:flutter_compose_ui_modifiers/util/m_error.dart';
import 'package:get/get.dart';

class MTile extends StatefulWidget {
  /// Please do not use DefineMTileModifier, just use `MTileModifier`.
  /// for example:
  /// ```
  /// MTile(
  ///  modifier: MTileModifier.color(Colors.red),
  ///  label: "Label",
  ///  )
  ///  ```
  final DefineMTileModifier? modifier;
  final String? label;
  final String Function()? builder;

  MTile({
    this.modifier,
    this.label,
    this.builder,
  }) : super(key: modifier?.valueKey ?? null);

  @override
  State<MTile> createState() => _MTileState();
}

class _MTileState extends ModifierState<MTile> with ObxImplementation {
  @override
  Widget build(BuildContext context) {
    if (widget.builder == null && widget.modifier?.valueObxListener != null) {
      throw MustSetBuilderException();
    }
    if (widget.builder != null && widget.label != null) {
      throw OnlyBuilderException("label");
    }
    final fontSize = widget.modifier?.valueStyle.fontSize ?? 18.px;
    return MGeneralLayoutModifierWidget(
      // key: modifier?.valueKey ?? key,
      generalModifier: widget.modifier,
      child: MRow(
        modifier: MRowModifier.mainAxisAlignment(MainAxisAlignment.start)
            .crossAxisAlignment(CrossAxisAlignment.center)
            .paddingHorizontal(16.px)
            .height(54.px)
            .backgroundColor(MThemeConfig.bgWhite22)
            .borderRadiusSet(
              (widget.modifier?.valueBorderRadius as BorderRadius?) ??
                  BorderRadius.all(Radius.circular(8.px)),
            )
            .marginHorizontal(16.px),
        children: [
          if (widget.modifier?.valueIcon != null)
            Image.asset(widget.modifier!.valueIcon!)
                .setSize(30.px)
                .marginRight(10.px),
          Text(widget.label ?? "Label")
              .color(widget.modifier?.valueLabelColor ?? Colors.white)
              .fontSize(fontSize)

              /// If use it will not center of the item.
              // .heightSize(modifier?.valueStyle.height ?? (25.px / fontSize))
              .expanded(),
          if (widget.modifier?.valueWidgetRight != null) ...[
            10.px.space,
            widget.modifier!.valueWidgetRight!
          ],
        ],
      ),
    );
  }

  @override
  Rx? get valueObxListener => widget.modifier?.valueObxListener;
}

final MTileModifier = DefineMTileModifier();

/// Please do not use it, just use `MTileModifier`.
class DefineMTileModifier extends MGeneralModifier {
  final TextStyle valueStyle;
  final TextAlign? valueTextAlign;
  final String? valueIcon;
  final Widget? valueWidgetRight;
  final Color? valueLabelColor;

  const DefineMTileModifier({
    this.valueStyle = const TextStyle(),
    this.valueTextAlign,
    this.valueIcon,
    this.valueWidgetRight,
    this.valueLabelColor,

    /// Main.
    super.valueKey,

    /// Container
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

  DefineMTileModifier copyWith({
    TextStyle? valueStyle,
    TextAlign? valueTextAlign,
    String? valueIcon,
    Widget? valueWidgetRight,
    Color? valueLabelColor,

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
    return DefineMTileModifier(
      valueStyle: valueStyle ?? this.valueStyle,
      valueTextAlign: valueTextAlign ?? this.valueTextAlign,
      valueIcon: valueIcon ?? this.valueIcon,
      valueWidgetRight: valueWidgetRight ?? this.valueWidgetRight,
      valueLabelColor: valueLabelColor ?? this.valueLabelColor,

      /// Container
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

extension MTileModifierPropertys on DefineMTileModifier {
  DefineMTileModifier color(Color color) {
    return setColor(color);
  }

  DefineMTileModifier colorHex(int color) {
    return setColor(Color(color));
  }

  DefineMTileModifier colorValue(int color) {
    return setColor(Color(color));
  }

  DefineMTileModifier setColor(Color color) {
    final newStyle = this.valueStyle.copyWith(color: color);
    final DefineMTileModifier newModifierValue =
        this.copyWith(valueStyle: newStyle);
    return newModifierValue;
  }

  DefineMTileModifier fontSize(double fontSize) {
    return setFontSize(fontSize);
  }

  DefineMTileModifier setFontSize(double fontSize) {
    final newStyle = this.valueStyle.copyWith(fontSize: fontSize);
    final DefineMTileModifier newModifierValue =
        this.copyWith(valueStyle: newStyle);
    return newModifierValue;
  }

  DefineMTileModifier letterSpacing(double value) {
    final newStyle = this.valueStyle.copyWith(letterSpacing: value);
    final DefineMTileModifier newModifierValue =
        this.copyWith(valueStyle: newStyle);
    return newModifierValue;
  }

  DefineMTileModifier fontFamily(String value) {
    final newStyle = this.valueStyle.copyWith(fontFamily: value);
    final DefineMTileModifier newModifierValue =
        this.copyWith(valueStyle: newStyle);
    return newModifierValue;
  }

  DefineMTileModifier lineHeight(double value) {
    return heightLine(value);
  }

  /// The line height, not container size Height.
  // DefineMTileModifier height(double value) {
  //   return heightLine(value);
  // }

  DefineMTileModifier textHeight(double value) {
    return heightLine(value);
  }

  DefineMTileModifier heightLine(double value) {
    final newStyle = this.valueStyle.copyWith(height: value);
    final DefineMTileModifier newModifierValue =
        this.copyWith(valueStyle: newStyle);
    return newModifierValue;
  }

  DefineMTileModifier textAlign(TextAlign value) {
    final DefineMTileModifier newModifierValue =
        this.copyWith(valueTextAlign: value);
    return newModifierValue;
  }

  DefineMTileModifier fontWeight(FontWeight fontWeight) {
    return setFontWeight(fontWeight);
  }

  DefineMTileModifier setFontWeight(FontWeight fontWeight) {
    final newStyle = this.valueStyle.copyWith(fontWeight: fontWeight);
    final DefineMTileModifier newModifierValue =
        this.copyWith(valueStyle: newStyle);
    return newModifierValue;
  }

  DefineMTileModifier style(TextStyle value) {
    final DefineMTileModifier newModifierValue =
        this.copyWith(valueStyle: value);
    return newModifierValue;
  }

  DefineMTileModifier icon(String? value) {
    final DefineMTileModifier newModifierValue =
        this.copyWith(valueIcon: value);
    return newModifierValue;
  }

  DefineMTileModifier widgetRight([Widget? value]) {
    final DefineMTileModifier newModifierValue =
        this.copyWith(valueWidgetRight: value);
    return newModifierValue;
  }

  DefineMTileModifier labelColor(Color? value) {
    final DefineMTileModifier newModifierValue =
        this.copyWith(valueLabelColor: value);
    return newModifierValue;
  }

  DefineMTileModifier copyButton({
    String? buttonText,
    String? copyContent,
    double? width,
    double? height,
    double? radius,
    VoidCallback? onCopy,
  }) {
    final heightResult = height ?? 32.px;
    final DefineMTileModifier newModifierValue = this.copyWith(
      valueWidgetRight: MButton(
        text: buttonText ?? "Copy",
        fontSize: 16.px,
        width: width,
        height: heightResult,
        maxHeight: heightResult,
        padding: width == null
            ? EdgeInsets.symmetric(horizontal: 10.px)
            : EdgeInsets.zero,
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 16.px)),
        onTap: () async {
          await Clipboard.setData(ClipboardData(text: copyContent ?? ""));
          if (onCopy != null) onCopy();
        },
      ),
    );
    return newModifierValue;
  }

  DefineMTileModifier switchButton({
    required RxBool value,
    final ValueChanged<bool>? onChanged,
    bool autoReverseState = true,
  }) {
    final DefineMTileModifier newModifierValue = this.copyWith(
      valueWidgetRight: Obx(
        () {
          return CupertinoSwitch(
            value: value.value,
            onChanged: (v) {
              if (autoReverseState) value.value = v;
              if (onChanged != null) onChanged(v);
            },
            activeColor: Color(0xffFD211E),
            trackColor: Colors.white.withOpacity(0.3),
          );
        },
      ),
    );
    return newModifierValue;
  }

  DefineMTileModifier arrowLabel(RxString value) {
    final DefineMTileModifier newModifierValue = this.copyWith(
      valueWidgetRight: Row(children: [
        Obx(
          () {
            return MText(
              modifier: MTextModifier.color(Colors.white).fontSize(14.px),
              data: value.value,
            );
          },
        ),
        3.px.space,
        MReverseWidget(
          child: MImage(
            modifier: MImageModifier.height(20.98.px)
                .package('flutter_compose_ui_modifiers'),
            data: 'assets/images/label_arrow.png',
          ).widthSet(22.px).center(),
        ),
      ]),
    );
    return newModifierValue;
  }

  DefineMTileModifier abel(RxString value) {
    final DefineMTileModifier newModifierValue = this.copyWith(
      valueWidgetRight: Obx(
        () {
          return MText(
            modifier: MTextModifier.color(Colors.white).fontSize(14.px),
            data: value.value,
          );
        },
      ),
    );
    return newModifierValue;
  }
}
