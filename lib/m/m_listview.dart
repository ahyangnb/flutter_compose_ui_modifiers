import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';

class MListView extends StatelessWidget {
  final DefineMListViewModifier? modifier;
  final List<Widget>? children;

  MListView({
    this.modifier,
    this.children,
  });

  @override
  Widget build(BuildContext context) {
    return MGeneralLayoutModifierWidget(
      generalModifier: modifier,

      /// Padding will be use in ListView, so we need to ignore it.
      ignoreList: [IgnoreModifierInGeneral.padding],
      child: ListView(
        padding: modifier?.valuePadding ?? EdgeInsets.zero,
        reverse: modifier?.valueReverse ?? false,
        children: children ?? [],
        shrinkWrap: modifier?.valueShrinkWrap ?? false,
        physics: modifier?.valuePhysics,
        controller: modifier?.valueController,
      ),
    );
  }
}

final MListViewModifier = DefineMListViewModifier();

class DefineMListViewModifier extends MGeneralModifier {
  final bool? valueReverse;

  /// Always align to Top even reverse.
  final bool? valueAlignTop;
  final bool? valueShrinkWrap;
  final ScrollPhysics? valuePhysics;
  final ScrollController? valueController;

  const DefineMListViewModifier({
    this.valueReverse,
    this.valueAlignTop,
    this.valueShrinkWrap,
    this.valuePhysics,
    this.valueController,
    super.valuePadding,
    super.valueMargin,
    super.valueOnTap,
    super.valueOnLongPress,
    super.valueOnLongPressMoveUpdate,
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

  /// Create a copyWith().
  DefineMListViewModifier copyWith({
    bool? valueReverse,
    bool? valueAlignTop,
    bool? valueShrinkWrap,
    ScrollPhysics? valuePhysics,
    ScrollController? valueController,

    /// The following properties are inherited from MGeneralModifier.
    EdgeInsets? valuePadding,
    EdgeInsets? valueMargin,
    GestureTapCallback? valueOnTap,
    GestureLongPressCallback? valueOnLongPress,
    GestureLongPressMoveUpdateCallback? valueOnLongPressMoveUpdate,
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
    return DefineMListViewModifier(
      valueReverse: valueReverse ?? this.valueReverse,
      valueAlignTop: valueAlignTop ?? this.valueAlignTop,
      valueShrinkWrap: valueShrinkWrap ?? this.valueShrinkWrap,
      valuePhysics: valuePhysics ?? this.valuePhysics,
      valueController: valueController ?? this.valueController,

      /// The following properties are inherited from MGeneralModifier.
      valuePadding: valuePadding ?? this.valuePadding,
      valueMargin: valueMargin ?? this.valueMargin,
      valueOnTap: valueOnTap ?? this.valueOnTap,
      valueOnLongPress: valueOnLongPress ?? this.valueOnLongPress,
      valueOnLongPressMoveUpdate:
          valueOnLongPressMoveUpdate ?? this.valueOnLongPressMoveUpdate,
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

      valueLeft: valueLeft ?? this.valueLeft,
      valueRight: valueRight ?? this.valueRight,
      valueTop: valueTop ?? this.valueTop,
      valueBottom: valueBottom ?? this.valueBottom,
    );
  }
}

extension MListViewModifierPropertys on DefineMListViewModifier {
  DefineMListViewModifier reverse(bool value) {
    return setReverse(value);
  }

  DefineMListViewModifier setReverse(bool value) {
    return this.copyWith(valueReverse: value);
  }

  DefineMListViewModifier physics(ScrollPhysics physics) {
    return setPhysics(physics);
  }

  DefineMListViewModifier setPhysics(ScrollPhysics physics) {
    return this.copyWith(valuePhysics: physics);
  }

  DefineMListViewModifier controller(ScrollController value) {
    return this.copyWith(valueController: value);
  }

  DefineMListViewModifier scrollController(ScrollController value) {
    return this.copyWith(valueController: value);
  }

  DefineMListViewModifier paddingZero() {
    return this.copyWith(valuePadding: EdgeInsets.zero);
  }
}
