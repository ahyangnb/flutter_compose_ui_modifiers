import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/config/modifier_config.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:flutter_compose_ui_modifiers/util/m_error.dart';
import 'package:get/get.dart';

class MRow extends StatefulWidget {
  /// Please do not use DefineMRowModifier, just use `MRowModifier`.
  /// for example:
  /// ```
  /// MRow(
  ///  modifier: MRowModifier.color(Colors.red),
  ///  children: [],
  ///  )
  ///  ```
  final DefineMRowModifier? modifier;
  final List<Widget>? children;
  final List<Widget> Function()? builder;

  MRow({
    this.children,
    this.builder,
    this.modifier,
  }) : super(key: modifier?.valueKey ?? null);

  @override
  State<MRow> createState() => _MRowState();
}

class _MRowState extends ModifierState<MRow> with ObxImplementation {
  @override
  Widget build(BuildContext context) {
    if (widget.builder == null && widget.modifier?.valueObxListener != null) {
      throw MustSetBuilderException();
    }
    if (widget.builder != null &&
        (widget.children != null || widget.modifier?.children != null)) {
      throw OnlyBuilderException("children");
    }

    final List<Widget> valueChildrenResult = <Widget>[
      ...widget.children ?? [],
      ...widget.modifier?.children ?? [],
      ...widget.builder != null ? widget.builder!() : [],
    ];
    return MGeneralLayoutModifierWidget(
      // key: modifier?.valueKey ?? key,
      generalModifier: widget.modifier,
      child: Row(
        crossAxisAlignment: widget.modifier?.valueCrossAxisAlignment ??
            ModifierConfig.defRowCrossAxisAlignment,
        mainAxisAlignment: widget.modifier?.valueMainAxisAlignment ??
            ModifierConfig.defRowMainAxisAlignment,
        children: widget.modifier?.valueReverse == true
            ? valueChildrenResult.reversed.toList()
            : valueChildrenResult,
      ),
    );
  }

  @override
  Rx? get valueObxListener => widget.modifier?.valueObxListener;
}

final MRowModifier = DefineMRowModifier();

/// Please do not use it, just use `MRowModifier`.
class DefineMRowModifier extends MGeneralModifier {
  final List<Widget>? children;
  final bool? valueReverse;

  final CrossAxisAlignment? valueCrossAxisAlignment;
  final MainAxisAlignment? valueMainAxisAlignment;

  const DefineMRowModifier({
    this.children,
    this.valueReverse,
    this.valueCrossAxisAlignment,
    this.valueMainAxisAlignment,

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
    super.valueFullWidth,
    super.valueFullHeight,
    super.valueContainerAlignment,
    super.valueOutSideAlignment,
    super.valueCancelFocusWhenClick,

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
    super.valueOutSideBackgroundColor,
    super.valueOutSideBorderRadius,
  });

  /// Create a copyWith().
  DefineMRowModifier copyWith({
    List<Widget>? children,
    bool? valueReverse,
    CrossAxisAlignment? valueCrossAxisAlignment,
    MainAxisAlignment? valueMainAxisAlignment,

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
    Rx<dynamic>? valueObxListener,
    Color? valueOutSideBackgroundColor,
    BorderRadiusGeometry? valueOutSideBorderRadius,
  }) {
    return DefineMRowModifier(
      children: children ?? this.children,
      valueReverse: valueReverse ?? this.valueReverse,
      valueCrossAxisAlignment:
          valueCrossAxisAlignment ?? this.valueCrossAxisAlignment,
      valueMainAxisAlignment:
          valueMainAxisAlignment ?? this.valueMainAxisAlignment,

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
      valueOutSideBackgroundColor:
          valueOutSideBackgroundColor ?? this.valueOutSideBackgroundColor,
      valueOutSideBorderRadius:
          valueOutSideBorderRadius ?? this.valueOutSideBorderRadius,
    );
  }
}

extension MRowModifierPropertys on DefineMRowModifier {
  DefineMRowModifier reverse(bool value) {
    return setReverse(value);
  }

  DefineMRowModifier setReverse(bool value) {
    return this.copyWith(valueReverse: value);
  }

  DefineMRowModifier add(Widget child) {
    return this.copyWith(children: (this.children ?? [])..add(child));
  }

  DefineMRowModifier addList(List<Widget> value) {
    return this.copyWith(children: (this.children ?? [])..addAll(value));
  }

  DefineMRowModifier centerCross() {
    return this.copyWith(valueCrossAxisAlignment: CrossAxisAlignment.center);
  }

  DefineMRowModifier crossAxisAlignment(CrossAxisAlignment value) {
    return this.copyWith(valueCrossAxisAlignment: value);
  }

  DefineMRowModifier centerMain() {
    return this.copyWith(valueMainAxisAlignment: MainAxisAlignment.center);
  }

  DefineMRowModifier mainAxisAlignment(MainAxisAlignment value) {
    return this.copyWith(valueMainAxisAlignment: value);
  }

  DefineMRowModifier mainAxisCenter() {
    return this.copyWith(valueMainAxisAlignment: MainAxisAlignment.center);
  }

  DefineMRowModifier mainAxisEnd() {
    return this.copyWith(valueMainAxisAlignment: MainAxisAlignment.end);
  }

  DefineMRowModifier mainAxisSpaceBetween() {
    return this
        .copyWith(valueMainAxisAlignment: MainAxisAlignment.spaceBetween);
  }

  DefineMRowModifier crossAxisCenter() {
    return this.copyWith(valueCrossAxisAlignment: CrossAxisAlignment.center);
  }

  DefineMRowModifier crossAxisEnd() {
    return this.copyWith(valueCrossAxisAlignment: CrossAxisAlignment.end);
  }

  DefineMRowModifier crossAxisStart() {
    return this.copyWith(valueCrossAxisAlignment: CrossAxisAlignment.start);
  }

  DefineMRowModifier crossStart() {
    return this.copyWith(valueCrossAxisAlignment: CrossAxisAlignment.start);
  }

  DefineMRowModifier startAlign() {
    return this.copyWith(valueCrossAxisAlignment: CrossAxisAlignment.start);
  }

  DefineMRowModifier mainCenter() {
    return this.copyWith(valueMainAxisAlignment: MainAxisAlignment.center);
  }

  DefineMRowModifier mainSpaceBetween() {
    return this
        .copyWith(valueMainAxisAlignment: MainAxisAlignment.spaceBetween);
  }
}
