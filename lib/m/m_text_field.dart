import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:flutter_compose_ui_modifiers/util/m_error.dart';
import 'package:get/get.dart';

class MTextField extends StatelessWidget {
  /// Please do not use DefineMTextFieldModifier, just use `MTextFieldModifier`.
  /// for example:
  /// ```
  /// MTextField(
  ///  modifier: MTextFieldModifier.color(Colors.red),
  ///  controller: TextEditingController().,
  ///  )
  ///  ```
  final DefineMTextFieldModifier? modifier;
  final TextEditingController? controller;

  MTextField({
    this.controller,
    this.modifier,
  }) : super(key: modifier?.valueKey ?? null);

  @override
  Widget build(BuildContext context) {
    if (modifier?.valueObxListener != null) {
      throw NotSupportObxListenerException();
    }
    InputDecoration inputDecoration =
        modifier?.decorationValue ?? InputDecoration();
    if (modifier?.valueFilled != null) {
      inputDecoration = inputDecoration.copyWith(filled: modifier?.valueFilled);
    }
    if (modifier?.valueFillColor != null) {
      inputDecoration =
          inputDecoration.copyWith(fillColor: modifier?.valueFillColor);
    }
    if (modifier?.valueInputBorder != null) {
      inputDecoration =
          inputDecoration.copyWith(border: modifier?.valueInputBorder);
    }
    return MGeneralLayoutModifierWidget(
      // key: modifier?.valueKey ?? key,
      generalModifier: modifier,
      child: TextField(
        autofocus: modifier?.valueAutoFocus ?? false,
        controller: controller ?? TextEditingController(),
        focusNode: modifier?.valueFocusNode ?? FocusNode(),
        decoration: inputDecoration,
        style: modifier?.valueStyle,
        expands: modifier?.expandsValue ?? false,
        maxLines: modifier?.maxLinesValue,
        maxLength: modifier?.valueMaxLength,
        onSubmitted: modifier?.valueOnSubmitted,
        keyboardType: modifier?.valueKeyboardType,
        textInputAction: modifier?.valueTextInputAction,
        onEditingComplete: modifier?.valueOnEditingComplete,
        textAlign: modifier?.valueTextAlign ?? TextAlign.start,
        enabled: modifier?.valueEnable ?? true,
        scrollPadding:
            modifier?.valueScrollPadding ?? const EdgeInsets.all(20.0),
        canRequestFocus:
            modifier?.valueCanRequestFocus ?? TextField().canRequestFocus,
        readOnly: modifier?.valueReadOnly ?? TextField().readOnly,
        showCursor: modifier?.valueShowCursor ?? TextField().showCursor,
        scrollController: modifier?.valueScrollController,
      ),
    );
  }
}

final MTextFieldModifier = DefineMTextFieldModifier();

/// Please do not use it, just use `MTextFieldModifier`.
class DefineMTextFieldModifier extends MGeneralModifier {
  final InputDecoration? decorationValue;
  final TextStyle? valueStyle;
  final bool? expandsValue;
  final int? maxLinesValue;
  final int? valueMaxLength;
  final bool? valueAutoFocus;
  final ValueChanged<String>? valueOnSubmitted;
  final TextInputType? valueKeyboardType;
  final TextInputAction? valueTextInputAction;
  final FocusNode? valueFocusNode;
  final VoidCallback? valueOnEditingComplete;
  final TextAlign? valueTextAlign;
  final bool? valueEnable;
  final bool? valueFilled;
  final Color? valueFillColor;
  final EdgeInsets? valueScrollPadding;
  final InputBorder? valueInputBorder;
  final bool? valueCanRequestFocus;
  final bool? valueReadOnly;
  final bool? valueShowCursor;
  final ScrollController? valueScrollController;

  const DefineMTextFieldModifier({
    this.decorationValue,
    this.valueStyle,
    this.expandsValue,
    this.maxLinesValue,
    this.valueMaxLength,
    this.valueAutoFocus,
    this.valueOnSubmitted,
    this.valueKeyboardType,
    this.valueTextInputAction,
    this.valueFocusNode,
    this.valueOnEditingComplete,
    this.valueTextAlign,
    this.valueEnable,
    this.valueFilled,
    this.valueFillColor,
    this.valueScrollPadding,
    this.valueInputBorder,
    this.valueCanRequestFocus,
    this.valueReadOnly,
    this.valueShowCursor,
    this.valueScrollController,

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
    super.valueSafeArea,
    super.valueVisible,
    super.valueObxListener,
  });

  /// Create a copyWith().
  DefineMTextFieldModifier copyWith({
    final InputDecoration? decorationValue,
    final TextStyle? valueStyle,
    final bool? expandsValue,
    final int? maxLinesValue,
    final int? valueMaxLength,
    final bool? valueAutoFocus,
    final ValueChanged<String>? valueOnSubmitted,
    final TextInputType? valueKeyboardType,
    final TextInputAction? valueTextInputAction,
    final FocusNode? valueFocusNode,
    final VoidCallback? valueOnEditingComplete,
    final TextAlign? valueTextAlign,
    final bool? valueEnable,
    final bool? valueFilled,
    final Color? valueFillColor,
    final EdgeInsets? valueScrollPadding,
    final InputBorder? valueInputBorder,
    final bool? valueCanRequestFocus,
    final bool? valueReadOnly,
    final bool? valueShowCursor,
    final ScrollController? valueScrollController,

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
    SafeArea? valueSafeArea,
    bool? valueVisible,
    Rx<dynamic>? valueObxListener,
  }) {
    return DefineMTextFieldModifier(
      decorationValue: decorationValue ?? this.decorationValue,
      valueStyle: valueStyle ?? this.valueStyle,
      expandsValue: expandsValue ?? this.expandsValue,
      maxLinesValue: maxLinesValue ?? this.maxLinesValue,
      valueMaxLength: valueMaxLength ?? this.valueMaxLength,
      valueAutoFocus: valueAutoFocus ?? this.valueAutoFocus,
      valueOnSubmitted: valueOnSubmitted ?? this.valueOnSubmitted,
      valueKeyboardType: valueKeyboardType ?? this.valueKeyboardType,
      valueTextInputAction: valueTextInputAction ?? this.valueTextInputAction,
      valueFocusNode: valueFocusNode ?? this.valueFocusNode,
      valueOnEditingComplete:
          valueOnEditingComplete ?? this.valueOnEditingComplete,
      valueTextAlign: valueTextAlign ?? this.valueTextAlign,
      valueEnable: valueEnable ?? this.valueEnable,
      valueFilled: valueFilled ?? this.valueFilled,
      valueFillColor: valueFillColor ?? this.valueFillColor,
      valueScrollPadding: valueScrollPadding ?? this.valueScrollPadding,
      valueInputBorder: valueInputBorder ?? this.valueInputBorder,
      valueCanRequestFocus: valueCanRequestFocus ?? this.valueCanRequestFocus,
      valueReadOnly: valueReadOnly ?? this.valueReadOnly,
      valueShowCursor: valueShowCursor ?? this.valueShowCursor,
      valueScrollController:
          valueScrollController ?? this.valueScrollController,

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

      /// Blur
      valueSigmaX: valueSigmaX ?? this.valueSigmaX,
      valueSigmaY: valueSigmaY ?? this.valueSigmaY,
      valueMaskColor: valueMaskColor ?? this.valueMaskColor,

      // Material
      valueMaterialType: valueMaterialType ?? this.valueMaterialType,
      valueMaterialElevation:
          valueMaterialElevation ?? this.valueMaterialElevation,

      // Other
      valueScrollable: valueScrollable ?? this.valueScrollable,
      valueSafeArea: valueSafeArea ?? this.valueSafeArea,
      valueVisible: valueVisible ?? this.valueVisible,
      valueObxListener: valueObxListener ?? this.valueObxListener,
    );
  }
}

extension MTextFieldModifierPropertys on DefineMTextFieldModifier {
  DefineMTextFieldModifier textInputAction(TextInputAction value) {
    return this.copyWith(valueTextInputAction: value);
  }

  DefineMTextFieldModifier keyboardType(TextInputType value) {
    return this.copyWith(valueKeyboardType: value);
  }

  DefineMTextFieldModifier onSubmitted(ValueChanged<String>? value) {
    return this.copyWith(valueOnSubmitted: value);
  }

  DefineMTextFieldModifier hintText(String value) {
    return this.copyWith(
      decorationValue:
          (this.decorationValue ?? InputDecoration()).copyWith(hintText: value),
    );
  }

  DefineMTextFieldModifier hintStyle(TextStyle value) {
    return this.copyWith(
      decorationValue: (this.decorationValue ?? InputDecoration())
          .copyWith(hintStyle: value),
    );
  }

  DefineMTextFieldModifier hintColor(Color value) {
    return this.copyWith(
      decorationValue: (this.decorationValue ?? InputDecoration()).copyWith(
          hintStyle: (this.decorationValue?.hintStyle ?? TextStyle())
              .copyWith(color: value)),
    );
  }

  DefineMTextFieldModifier hintFontSize(double? value) {
    return this.copyWith(
      decorationValue: (this.decorationValue ?? InputDecoration()).copyWith(
          hintStyle: (this.decorationValue?.hintStyle ?? TextStyle())
              .copyWith(fontSize: value)),
    );
  }

  DefineMTextFieldModifier hintFontWeight(FontWeight value) {
    return this.copyWith(
      decorationValue: (this.decorationValue ?? InputDecoration()).copyWith(
          hintStyle: (this.decorationValue?.hintStyle ?? TextStyle())
              .copyWith(fontWeight: value)),
    );
  }

  // The border is repeat with generate border of container.
  // DefineMTextFieldModifier border(InputBorder value) {
  //   return this.copyWith(
  //     decorationValue:
  //         (this.decorationValue ?? InputDecoration()).copyWith(border: value),
  //   );
  // }

  DefineMTextFieldModifier autoFocus(bool value) {
    return this.copyWith(valueAutoFocus: value);
  }

  DefineMTextFieldModifier noneBorder() {
    return this.copyWith(
      decorationValue: (this.decorationValue ?? InputDecoration())
          .copyWith(border: InputBorder.none),
    );
  }

  DefineMTextFieldModifier underlineBorder(Color color) {
    return this.copyWith(
      decorationValue: (this.decorationValue ?? InputDecoration()).copyWith(
        border: UnderlineInputBorder(borderSide: BorderSide(color: color)),
      ),
    );
  }

  DefineMTextFieldModifier contentPadding(EdgeInsetsGeometry value) {
    return this.copyWith(
      decorationValue: (this.decorationValue ?? InputDecoration())
          .copyWith(contentPadding: value),
    );
  }

  DefineMTextFieldModifier contentPaddingZero() {
    return this.copyWith(
      decorationValue: (this.decorationValue ?? InputDecoration())
          .copyWith(contentPadding: EdgeInsets.zero),
    );
  }

  EdgeInsets? get thisPadding =>
      (this.decorationValue?.contentPadding is EdgeInsets? &&
              this.decorationValue?.contentPadding != null)
          ? this.decorationValue?.contentPadding as EdgeInsets
          : EdgeInsets.zero;

  DefineMTextFieldModifier contentPaddingHorizontal(double value) {
    final newPadding = EdgeInsets.only(
      top: thisPadding?.top ?? 0,
      bottom: thisPadding?.bottom ?? 0,
      left: value,
      right: value,
    );
    return this.copyWith(
      decorationValue: (this.decorationValue ?? InputDecoration())
          .copyWith(contentPadding: newPadding),
    );
  }

  DefineMTextFieldModifier contentPaddingVertical(double value) {
    final newPadding = EdgeInsets.only(
      top: value,
      bottom: value,
      left: thisPadding?.left ?? 0,
      right: thisPadding?.right ?? 0,
    );
    return this.copyWith(
      decorationValue: (this.decorationValue ?? InputDecoration())
          .copyWith(contentPadding: newPadding),
    );
  }

  DefineMTextFieldModifier contentPaddingLeft(double value) {
    final newPadding = EdgeInsets.only(
      top: thisPadding?.top ?? 0,
      bottom: thisPadding?.bottom ?? 0,
      left: value,
      right: thisPadding?.right ?? 0,
    );
    return this.copyWith(
      decorationValue: (this.decorationValue ?? InputDecoration())
          .copyWith(contentPadding: newPadding),
    );
  }

  DefineMTextFieldModifier contentPaddingRight(double value) {
    final newPadding = EdgeInsets.only(
      top: thisPadding?.top ?? 0,
      bottom: thisPadding?.bottom ?? 0,
      left: thisPadding?.left ?? 0,
      right: value,
    );
    return this.copyWith(
      decorationValue: (this.decorationValue ?? InputDecoration())
          .copyWith(contentPadding: newPadding),
    );
  }

  DefineMTextFieldModifier contentPaddingTop(double value) {
    final newPadding = EdgeInsets.only(
      top: value,
      bottom: thisPadding?.bottom ?? 0,
      left: thisPadding?.left ?? 0,
      right: thisPadding?.right ?? 0,
    );
    return this.copyWith(
      decorationValue: (this.decorationValue ?? InputDecoration()).copyWith(
        contentPadding: newPadding,
      ),
    );
  }

  DefineMTextFieldModifier contentPaddingBottom(double value) {
    final newPadding = EdgeInsets.only(
      top: thisPadding?.top ?? 0,
      bottom: value,
      left: thisPadding?.left ?? 0,
      right: thisPadding?.right ?? 0,
    );
    return this.copyWith(
      decorationValue: (this.decorationValue ?? InputDecoration()).copyWith(
        contentPadding: newPadding,
      ),
    );
  }

  DefineMTextFieldModifier contentPaddingNone() {
    return this.copyWith(
      decorationValue: (this.decorationValue ?? InputDecoration())
          .copyWith(contentPadding: EdgeInsets.zero),
    );
  }

  DefineMTextFieldModifier decoration(InputDecoration value) {
    return this.copyWith(decorationValue: value);
  }

  DefineMTextFieldModifier borderInput(InputBorder value) {
    return this.copyWith(valueInputBorder: value);
  }

  DefineMTextFieldModifier inputBorder(InputBorder value) {
    return this.copyWith(valueInputBorder: value);
  }

  DefineMTextFieldModifier style(TextStyle value) {
    return this.copyWith(valueStyle: value);
  }

  DefineMTextFieldModifier expands(bool? value) {
    return this.copyWith(expandsValue: value);
  }

  DefineMTextFieldModifier maxLines(int? value) {
    return this.copyWith(maxLinesValue: value);
  }

  DefineMTextFieldModifier maxLength(int? value) {
    return this.copyWith(valueMaxLength: value);
  }

  DefineMTextFieldModifier labelColor(Color value) {
    return this.copyWith(
        valueStyle: (this.valueStyle ?? TextStyle()).copyWith(color: value));
  }

  DefineMTextFieldModifier labelFontSize(double value) {
    return this.copyWith(
        valueStyle: (this.valueStyle ?? TextStyle()).copyWith(fontSize: value));
  }

  DefineMTextFieldModifier labelFontWeight(FontWeight value) {
    return this.copyWith(
        valueStyle:
            (this.valueStyle ?? TextStyle()).copyWith(fontWeight: value));
  }

  DefineMTextFieldModifier styleWhiteOpacity1({String? hintText}) {
    return this.copyWith(
      decorationValue: (this.decorationValue ?? InputDecoration()).copyWith(
          hintText: hintText ?? 'Please enter your name...',
          hintStyle: MThemeConfig.textFieldHintStyle),
      valueStyle: MThemeConfig.textFieldStyle,
      valueBackgroundColor: MThemeConfig.bgWhite22,
      valueBorderRadius: BorderRadius.circular(8),
      valueHeight: 52,
    );
  }

  DefineMTextFieldModifier focusNode([FocusNode? value]) {
    return this.copyWith(valueFocusNode: value);
  }

  DefineMTextFieldModifier onEditingComplete([VoidCallback? value]) {
    return this.copyWith(valueOnEditingComplete: value);
  }

  DefineMTextFieldModifier color([Color? value]) {
    return this.copyWith(
        valueStyle: (this.valueStyle ?? TextStyle()).copyWith(color: value));
  }

  DefineMTextFieldModifier fontSize([double? value]) {
    return this.copyWith(
        valueStyle: (this.valueStyle ?? TextStyle()).copyWith(fontSize: value));
  }

  DefineMTextFieldModifier textAlign([TextAlign? value]) {
    return this.copyWith(valueTextAlign: value);
  }

  DefineMTextFieldModifier enable(bool? value) {
    return this.copyWith(valueEnable: value ?? true);
  }

  DefineMTextFieldModifier filled(bool? value) {
    return this.copyWith(valueFilled: value ?? true);
  }

  DefineMTextFieldModifier fillColor(Color? value) {
    return this.copyWith(valueFillColor: value);
  }

  DefineMTextFieldModifier scrollPadding(EdgeInsets? value) {
    return this.copyWith(valueScrollPadding: value);
  }

  DefineMTextFieldModifier canRequestFocus(bool? value) {
    return this.copyWith(valueCanRequestFocus: value);
  }

  DefineMTextFieldModifier readOnly(bool? value) {
    return this.copyWith(valueReadOnly: value);
  }

  DefineMTextFieldModifier showCursor(bool? value) {
    return this.copyWith(valueShowCursor: value);
  }

  /// Will be contain it in m.g.dart
// DefineMTextFieldModifier scrollController(ScrollController? value) {
//   return this.copyWith(valueScrollController: value);
// }
}
