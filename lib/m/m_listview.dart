import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';

class MListView extends StatelessWidget {
  final MListViewModifierDefine? modifier;
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
      ignoreList: [IgnoreModifierInGeneral.paddingValue],
      child: ListView(
        padding: modifier?.paddingValue ?? EdgeInsets.zero,
        children: children ?? [],
      ),
    );
  }
}

final MListViewModifier = MListViewModifierDefine();

class MListViewModifierDefine extends MGeneralModifier {
  final bool? reverseValue;

  /// Always align to Top even reverse.
  final bool? alignTopValue;
  final bool? shrinkWrapValue;
  final ScrollPhysics? physicsValue;

  const MListViewModifierDefine({
    this.reverseValue,
    this.alignTopValue,
    this.shrinkWrapValue,
    this.physicsValue,
    super.paddingValue,
    super.marginValue,
    super.onTapValue,
    super.backgroundColorValue,
    super.borderRadiusValue,
    super.centerAlignValue,
    super.widthValue,
    super.heightValue,
    super.shadowValue,
    super.transformValue,
    super.constraintsValue,
    super.aspectRatioValue,
    super.flexValue,
    super.helpValue,
    super.opacityValue,
    super.rotateValue,
    super.scaleValue,
  });

  /// Create a copyWith().
  MListViewModifierDefine copyWith({
    bool? reverseValue,
    bool? alignTopValue,
    bool? shrinkWrapValue,
    ScrollPhysics? physicsValue,

    /// The following properties are inherited from MGeneralModifier.
    EdgeInsets? paddingValue,
    EdgeInsets? marginValue,
    GestureTapCallback? onTapValue,
    Color? backgroundColorValue,
    BorderRadius? borderRadiusValue,
    bool? centerAlignValue,
    double? widthValue,
    double? heightValue,
    BoxShadow? shadowValue,
    Matrix4? transformValue,
    BoxConstraints? constraintsValue,
    double? aspectRatioValue,
    int? flexValue,
    String? helpValue,
    double? opacityValue,
    double? rotateValue,
    double? scaleValue,
  }) {
    return MListViewModifierDefine(
      reverseValue: reverseValue ?? this.reverseValue,
      alignTopValue: alignTopValue ?? this.alignTopValue,
      shrinkWrapValue: shrinkWrapValue ?? this.shrinkWrapValue,
      physicsValue: physicsValue ?? this.physicsValue,

      /// The following properties are inherited from MGeneralModifier.
      paddingValue: paddingValue ?? this.paddingValue,
      marginValue: marginValue ?? this.marginValue,
      onTapValue: onTapValue ?? this.onTapValue,
      backgroundColorValue: backgroundColorValue ?? this.backgroundColorValue,
      borderRadiusValue: borderRadiusValue ?? this.borderRadiusValue,
      centerAlignValue: centerAlignValue ?? this.centerAlignValue,
      widthValue: widthValue ?? this.widthValue,
      heightValue: heightValue ?? this.heightValue,
      shadowValue: shadowValue ?? this.shadowValue,
      transformValue: transformValue ?? this.transformValue,
      constraintsValue: constraintsValue ?? this.constraintsValue,
      aspectRatioValue: aspectRatioValue ?? this.aspectRatioValue,
      flexValue: flexValue ?? this.flexValue,
      helpValue: helpValue ?? this.helpValue,
      opacityValue: opacityValue ?? this.opacityValue,
      rotateValue: rotateValue ?? this.rotateValue,
      scaleValue: scaleValue ?? this.scaleValue,
    );
  }
}

extension MListViewModifierPropertys on MListViewModifierDefine {
  MListViewModifierDefine padding(EdgeInsets value) {
    return setPadding(value);
  }

  MListViewModifierDefine setPadding(EdgeInsets? value) {
    return this.copyWith(
      paddingValue: value ?? this.paddingValue ?? EdgeInsets.zero,
    );
  }

  MListViewModifierDefine paddingTop(double value) {
    return setPaddingTop(value);
  }

  MListViewModifierDefine setPaddingTop(double value) {
    return this.copyWith(
      paddingValue: (this.paddingValue ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  MListViewModifierDefine paddingHorizontal(double value) {
    return setPaddingHorizontal(value);
  }

  MListViewModifierDefine setPaddingHorizontal(double value) {
    return this.copyWith(
      paddingValue: (this.paddingValue ?? EdgeInsets.zero)
          .copyWith(left: value, right: value),
    );
  }

  MListViewModifierDefine paddingVertical(double value) {
    return setPaddingVertical(value);
  }

  MListViewModifierDefine setPaddingVertical(double value) {
    return this.copyWith(
      paddingValue: (this.paddingValue ?? EdgeInsets.zero)
          .copyWith(top: value, bottom: value),
    );
  }

  MListViewModifierDefine reverse(bool value) {
    return setReverse(value);
  }

  MListViewModifierDefine setReverse(bool value) {
    return this.copyWith(reverseValue: value);
  }

  MListViewModifierDefine physics(ScrollPhysics physics) {
    return setPhysics(physics);
  }

  MListViewModifierDefine setPhysics(ScrollPhysics physics) {
    return this.copyWith(physicsValue: physics);
  }
}
