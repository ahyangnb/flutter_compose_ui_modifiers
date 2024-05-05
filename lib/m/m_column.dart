import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/config/modifier_config.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';

class MColumn extends StatelessWidget {
  final MColumnModifierDefine? modifier;
  final List<Widget>? children;

  MColumn({
    this.children,
    this.modifier,
  });

  @override
  Widget build(BuildContext context) {
    return MGeneralLayoutModifierWidget(
      generalModifier: modifier,
      child: Column(
        crossAxisAlignment: modifier?.crossAxisAlignmentValue ??
            ModifierConfig.defColumnCrossAxisAlignment,
        mainAxisAlignment: modifier?.mainAxisAlignmentValue ??
            ModifierConfig.defColumnMainAxisAlignment,
        children: [
          ...children ?? [],
          ...modifier?.children ?? [],
        ],
      ),
    );
  }
}

final MColumnModifier = MColumnModifierDefine();

class MColumnModifierDefine extends MGeneralModifier {
  final List<Widget>? children;
  final bool? reverseValue;

  /// Always align to Top even reverse.
  final bool? alignTopValue;
  final bool? shrinkWrapValue;
  final ScrollPhysics? physicsValue;
  final CrossAxisAlignment? crossAxisAlignmentValue;
  final MainAxisAlignment? mainAxisAlignmentValue;

  const MColumnModifierDefine({
    this.children,
    this.reverseValue,
    this.alignTopValue,
    this.shrinkWrapValue,
    this.physicsValue,
    this.crossAxisAlignmentValue,
    this.mainAxisAlignmentValue,
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
  MColumnModifierDefine copyWith({
    List<Widget>? children,
    bool? reverseValue,
    bool? alignTopValue,
    bool? shrinkWrapValue,
    ScrollPhysics? physicsValue,
    CrossAxisAlignment? crossAxisAlignmentValue,
    MainAxisAlignment? mainAxisAlignmentValue,

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
    return MColumnModifierDefine(
      children: children ?? this.children,
      reverseValue: reverseValue ?? this.reverseValue,
      alignTopValue: alignTopValue ?? this.alignTopValue,
      shrinkWrapValue: shrinkWrapValue ?? this.shrinkWrapValue,
      physicsValue: physicsValue ?? this.physicsValue,
      crossAxisAlignmentValue:
          crossAxisAlignmentValue ?? this.crossAxisAlignmentValue,
      mainAxisAlignmentValue:
          mainAxisAlignmentValue ?? this.mainAxisAlignmentValue,

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

extension MColumnModifierPropertys on MColumnModifierDefine {
  MColumnModifierDefine reverse(bool value) {
    return setReverse(value);
  }

  MColumnModifierDefine setReverse(bool value) {
    return this.copyWith(reverseValue: value);
  }

  MColumnModifierDefine physics(ScrollPhysics physics) {
    return setPhysics(physics);
  }

  MColumnModifierDefine setPhysics(ScrollPhysics physics) {
    return this.copyWith(physicsValue: physics);
  }

  MColumnModifierDefine add(Widget child) {
    return this.copyWith(children: (this.children ?? [])..add(child));
  }

  MColumnModifierDefine crossAxisAlignment(CrossAxisAlignment value) {
    return this.copyWith(crossAxisAlignmentValue: value);
  }

  MColumnModifierDefine mainAxisAlignment(MainAxisAlignment value) {
    return this.copyWith(mainAxisAlignmentValue: value);
  }

  /// General============Start
  ///
  MColumnModifierDefine shadow(BoxShadow value) {
    return this.copyWith(shadowValue: value);
  }

  MColumnModifierDefine shadowDef({Color? color}) {
    final value = BoxShadow(
      color: color ?? Color(0xff000000).withOpacity(0.1),
      offset: const Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    );
    return this.copyWith(shadowValue: value);
  }

  MColumnModifierDefine padding(EdgeInsets value) {
    return setPadding(value);
  }

  MColumnModifierDefine setPadding(EdgeInsets? value) {
    return this.copyWith(
      paddingValue: value ?? this.paddingValue ?? EdgeInsets.zero,
    );
  }

  MColumnModifierDefine paddingTop(double value) {
    return setPaddingTop(value);
  }

  MColumnModifierDefine setPaddingTop(double value) {
    return this.copyWith(
      paddingValue: (this.paddingValue ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  MColumnModifierDefine paddingHorizontal(double value) {
    return setPaddingHorizontal(value);
  }

  MColumnModifierDefine setPaddingHorizontal(double value) {
    return this.copyWith(
      paddingValue: (this.paddingValue ?? EdgeInsets.zero)
          .copyWith(left: value, right: value),
    );
  }

  MColumnModifierDefine paddingVertical(double value) {
    return setPaddingVertical(value);
  }

  MColumnModifierDefine setPaddingVertical(double value) {
    return this.copyWith(
      paddingValue: (this.paddingValue ?? EdgeInsets.zero)
          .copyWith(top: value, bottom: value),
    );
  }

  MColumnModifierDefine paddingBottom(double value) {
    return this.copyWith(
      paddingValue:
          (this.paddingValue ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  MColumnModifierDefine marginTop(double value) {
    return this.copyWith(
      marginValue: (this.marginValue ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  MColumnModifierDefine marginBottom(double value) {
    return this.copyWith(
      marginValue:
          (this.marginValue ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  MColumnModifierDefine margin(EdgeInsets? marginValue) {
    return this.copyWith(marginValue: marginValue);
  }

  MColumnModifierDefine backgroundColor(Color? value) {
    return this.copyWith(backgroundColorValue: value);
  }

  MColumnModifierDefine center(bool value) {
    return this.copyWith(centerAlignValue: value);
  }

  MColumnModifierDefine size(Size value) {
    return this.copyWith(widthValue: value.width, heightValue: value.height);
  }

  MColumnModifierDefine width(double? value) {
    return this.copyWith(widthValue: value);
  }

  MColumnModifierDefine height(double? value) {
    return this.copyWith(heightValue: value);
  }

  MColumnModifierDefine onTap(VoidCallback onTap) {
    return setClick(onTap);
  }

  MColumnModifierDefine onClick(VoidCallback onTap) {
    return setClick(onTap);
  }

  MColumnModifierDefine click(VoidCallback onTap) {
    return setClick(onTap);
  }

  MColumnModifierDefine setClick(VoidCallback onTapValue) {
    return this.copyWith(onTapValue: onTapValue);
  }

  MColumnModifierDefine borderRadius(double value) {
    return this.copyWith(borderRadiusValue: BorderRadius.circular(value));
  }

  MColumnModifierDefine borderRadiusVertical(double value) {
    return this.copyWith(
        borderRadiusValue: BorderRadius.vertical(
            top: Radius.circular(value), bottom: Radius.circular(value)));
  }

  MColumnModifierDefine borderRadiusHorizontal(double value) {
    return this.copyWith(
        borderRadiusValue: BorderRadius.horizontal(
            left: Radius.circular(value), right: Radius.circular(value)));
  }

  /// General============End
}
