import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:flutter_compose_ui_modifiers/util/m_error.dart';
import 'package:get/get.dart';

class MListView extends StatefulWidget {
  /// Please do not use DefineMListViewModifier, just use `MListViewModifier`.
  /// for example:
  /// ```
  /// MListView(
  ///  modifier: MListViewModifier.color(Colors.red),
  ///  children: [],
  ///  )
  ///  ```
  final DefineMListViewModifier? modifier;
  final List<Widget>? children;
  final List<Widget> Function()? builder;

  MListView({
    this.modifier,
    this.children,
    this.builder,
  }) : super(key: modifier?.valueKey ?? null);

  @override
  State<MListView> createState() => _MListViewState();
}

class _MListViewState extends ModifierState<MListView>
    with AutoOnScrollStop, ObxImplementation {
  @override
  late ScrollController useController =
      widget.modifier?.valueController ?? ScrollController();

  @override
  VoidCallback? get valueOnScrollStop => widget.modifier?.valueOnScrollStop;

  @override
  Widget build(BuildContext context) {
    if (widget.builder == null && widget.modifier?.valueObxListener != null) {
      throw MustSetBuilderException();
    }

    /// The MListView not have widget.modifier?.children.
    // (widget.children != null || widget.modifier?.children != null)
    if (widget.builder != null && widget.children != null) {
      throw OnlyBuilderException("children");
    }

    return MGeneralLayoutModifierWidget(
      // key: widget.modifier?.valueKey ?? widget.key,
      generalModifier: widget.modifier,

      /// Padding will be use in ListView, so we need to ignore it.
      ignoreList: [IgnoreModifierInGeneral.padding],
      child: ListView(
        padding: widget.modifier?.valuePadding ?? EdgeInsets.zero,
        reverse: widget.modifier?.valueReverse ?? false,
        children: widget.children ?? [],
        shrinkWrap: widget.modifier?.valueShrinkWrap ?? false,
        physics: widget.modifier?.valuePhysics,
        controller: useController,
        scrollDirection: widget.modifier?.valueScrollDirection ?? Axis.vertical,
      ),
    );
  }

  @override
  Rx? get valueObxListener => widget.modifier?.valueObxListener;
}

mixin AutoOnScrollStop<T extends StatefulWidget> on ModifierState<T> {
  late ScrollController useController;

  VoidCallback? get valueOnScrollStop;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    if (valueOnScrollStop != null) {
      useController.addListener(_onScroll);
    }
  }

  @override
  Widget build(BuildContext context) {
    return build(context);
  }

  void _onScroll() {
    _timer?.cancel();
    _timer = Timer(const Duration(milliseconds: 800), () {
      valueOnScrollStop!();
    });
  }

  @override
  void dispose() {
    useController.removeListener(_onScroll);
    useController.dispose();
    _timer?.cancel();
    super.dispose();
  }
}

final MListViewModifier = DefineMListViewModifier();

/// Please do not use it, just use `MListViewModifier`.
class DefineMListViewModifier extends MGeneralModifier {
  final bool? valueReverse;

  /// Always align to Top even reverse.
  final bool? valueAlignTop;
  final bool? valueShrinkWrap;
  final ScrollPhysics? valuePhysics;
  final ScrollController? valueController;
  final VoidCallback? valueOnScrollStop;
  final Axis? valueScrollDirection;

  const DefineMListViewModifier({
    this.valueReverse,
    this.valueAlignTop,
    this.valueShrinkWrap,
    this.valuePhysics,
    this.valueController,
    this.valueOnScrollStop,
    this.valueScrollDirection,

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
    // super.valueScrollable,
    super.valueSafeArea,
    super.valueVisible,
    super.valueTabLength,
    super.valueObxListener,
    super.valueOutsideBackgroundColor,
    super.valueOutsideBorderRadius, super.valueHeroTag,
  });

  /// Create a copyWith().
  DefineMListViewModifier copyWith({
    bool? valueReverse,
    bool? valueAlignTop,
    bool? valueShrinkWrap,
    ScrollPhysics? valuePhysics,
    ScrollController? valueController,
    VoidCallback? valueOnScrollStop,
    Axis? valueScrollDirection,

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
    // bool? valueScrollable,
    SafeArea? valueSafeArea,
    bool? valueVisible,
    int? valueTabLength,
    Rx<dynamic>? valueObxListener,
    Color? valueOutsideBackgroundColor,
    BorderRadiusGeometry? valueOutsideBorderRadius, Object? valueHeroTag,
  }) {
    return DefineMListViewModifier(
      valueReverse: valueReverse ?? this.valueReverse,
      valueAlignTop: valueAlignTop ?? this.valueAlignTop,
      valueShrinkWrap: valueShrinkWrap ?? this.valueShrinkWrap,
      valuePhysics: valuePhysics ?? this.valuePhysics,
      valueController: valueController ?? this.valueController,
      valueOnScrollStop: valueOnScrollStop ?? this.valueOnScrollStop,
      valueScrollDirection: valueScrollDirection ?? this.valueScrollDirection,

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
          valueCancelFocusWhenClick ?? this.valueCancelFocusWhenClick,valueOutsideBorder:
          valueOutsideBorder ?? valueOutsideBorder,

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
      // valueScrollable: valueScrollable ?? this.valueScrollable,
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

  DefineMListViewModifier onScrollStop(VoidCallback value) {
    return this.copyWith(valueOnScrollStop: value);
  }

  DefineMListViewModifier scrollDirection(Axis value) {
    return this.copyWith(valueScrollDirection: value);
  }
}
