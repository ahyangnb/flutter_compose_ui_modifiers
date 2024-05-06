import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/config/modifier_config.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';

class MRow extends StatelessWidget {
  final MRowModifierDefine? modifier;
  final List<Widget>? children;

  MRow({
    this.children,
    this.modifier,
  });

  @override
  Widget build(BuildContext context) {
    return MGeneralLayoutModifierWidget(
      generalModifier: modifier,
      child: Row(
        crossAxisAlignment: modifier?.crossAxisAlignmentValue ??
            ModifierConfig.defRowCrossAxisAlignment,
        mainAxisAlignment: modifier?.mainAxisAlignmentValue ??
            ModifierConfig.defRowMainAxisAlignment,
        children: [
          ...children ?? [],
          ...modifier?.children ?? [],
        ],
      ),
    );
  }
}

final MRowModifier = MRowModifierDefine();

class MRowModifierDefine extends MGeneralModifier {
  final List<Widget>? children;
  final bool? reverseValue;

  /// Always align to Top even reverse.
  final bool? alignTopValue;
  final bool? shrinkWrapValue;
  final ScrollPhysics? physicsValue;
  final CrossAxisAlignment? crossAxisAlignmentValue;
  final MainAxisAlignment? mainAxisAlignmentValue;

  const MRowModifierDefine({
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
  MRowModifierDefine copyWith({
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
    return MRowModifierDefine(
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

extension MRowModifierPropertys on MRowModifierDefine {
  MRowModifierDefine reverse(bool value) {
    return setReverse(value);
  }

  MRowModifierDefine setReverse(bool value) {
    return this.copyWith(reverseValue: value);
  }

  MRowModifierDefine physics(ScrollPhysics physics) {
    return setPhysics(physics);
  }

  MRowModifierDefine setPhysics(ScrollPhysics physics) {
    return this.copyWith(physicsValue: physics);
  }

  MRowModifierDefine add(Widget child) {
    return this.copyWith(children: (this.children ?? [])..add(child));
  }

  MRowModifierDefine addList(List<Widget> value) {
    return this.copyWith(children: (this.children ?? [])..addAll(value));
  }

  MRowModifierDefine crossAxisAlignment(CrossAxisAlignment value) {
    return this.copyWith(crossAxisAlignmentValue: value);
  }

  MRowModifierDefine mainAxisAlignment(MainAxisAlignment value) {
    return this.copyWith(mainAxisAlignmentValue: value);
  }

  /// General============Start
  ///
  MRowModifierDefine shadow(BoxShadow value) {
    return this.copyWith(shadowValue: value);
  }

  MRowModifierDefine shadowDef({Color? color}) {
    final value = BoxShadow(
      color: color ?? Color(0xff000000).withOpacity(0.1),
      offset: const Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    );
    return this.copyWith(shadowValue: value);
  }

  MRowModifierDefine padding(double value) {
    return setPaddingEdge(EdgeInsets.all(value));
  }

  MRowModifierDefine paddingSet(EdgeInsets value) {
    return setPaddingEdge(value);
  }

  MRowModifierDefine setPaddingEdge(EdgeInsets? value) {
    return this.copyWith(
      paddingValue: value ?? this.paddingValue ?? EdgeInsets.zero,
    );
  }

  MRowModifierDefine paddingTop(double value) {
    return setPaddingTop(value);
  }

  MRowModifierDefine setPaddingTop(double value) {
    return this.copyWith(
      paddingValue: (this.paddingValue ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  MRowModifierDefine paddingHorizontal(double value) {
    return setPaddingHorizontal(value);
  }

  MRowModifierDefine setPaddingHorizontal(double value) {
    return this.copyWith(
      paddingValue: (this.paddingValue ?? EdgeInsets.zero)
          .copyWith(left: value, right: value),
    );
  }

  MRowModifierDefine paddingVertical(double value) {
    return setPaddingVertical(value);
  }

  MRowModifierDefine setPaddingVertical(double value) {
    return this.copyWith(
      paddingValue: (this.paddingValue ?? EdgeInsets.zero)
          .copyWith(top: value, bottom: value),
    );
  }

  MRowModifierDefine paddingBottom(double value) {
    return this.copyWith(
      paddingValue:
          (this.paddingValue ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  MRowModifierDefine marginTop(double value) {
    return this.copyWith(
      marginValue: (this.marginValue ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  MRowModifierDefine marginBottom(double value) {
    return this.copyWith(
      marginValue:
          (this.marginValue ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  MRowModifierDefine marginLeft(double value) {
    return this.copyWith(
      marginValue: (this.marginValue ?? EdgeInsets.zero).copyWith(left: value),
    );
  }

  MRowModifierDefine marginRight(double value) {
    return this.copyWith(
      marginValue: (this.marginValue ?? EdgeInsets.zero).copyWith(right: value),
    );
  }

  MRowModifierDefine marginHorizontal(double value) {
    return marginSymmetric(horizontal: value);
  }

  MRowModifierDefine marginVertical(double value) {
    return marginSymmetric(vertical: value);
  }

  MRowModifierDefine marginSymmetric({double? horizontal, double? vertical}) {
    return this.copyWith(
      marginValue: (this.marginValue ?? EdgeInsets.zero).copyWith(
        left: horizontal ?? this.marginValue?.left,
        right: horizontal ?? this.marginValue?.right,
        top: vertical ?? this.marginValue?.top,
        bottom: vertical ?? this.marginValue?.bottom,
      ),
    );
  }

  MRowModifierDefine marginOnly({
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    return this.copyWith(
      marginValue: (this.marginValue ?? EdgeInsets.zero).copyWith(
        left: left ?? this.marginValue?.left,
        right: right ?? this.marginValue?.right,
        top: top ?? this.marginValue?.top,
        bottom: bottom ?? this.marginValue?.bottom,
      ),
    );
  }

  MRowModifierDefine marginSet(EdgeInsets? value) {
    return this.copyWith(marginValue: value);
  }

  MRowModifierDefine margin(double? value) {
    return this.copyWith(marginValue: EdgeInsets.all(value ?? 0));
  }

  MRowModifierDefine backgroundColor(Color? value) {
    return this.copyWith(backgroundColorValue: value);
  }

  MRowModifierDefine center(bool value) {
    return this.copyWith(centerAlignValue: value);
  }

  MRowModifierDefine size(Size value) {
    return this.copyWith(widthValue: value.width, heightValue: value.height);
  }

  MRowModifierDefine width(double? value) {
    return this.copyWith(widthValue: value);
  }

  MRowModifierDefine height(double? value) {
    return this.copyWith(heightValue: value);
  }

  MRowModifierDefine onTap(VoidCallback onTap) {
    return setClick(onTap);
  }

  MRowModifierDefine onClick(VoidCallback onTap) {
    return setClick(onTap);
  }

  MRowModifierDefine click(VoidCallback onTap) {
    return setClick(onTap);
  }

  MRowModifierDefine setClick(VoidCallback onTapValue) {
    return this.copyWith(onTapValue: onTapValue);
  }

  MRowModifierDefine borderRadius(double value) {
    return this.copyWith(borderRadiusValue: BorderRadius.circular(value));
  }

  MRowModifierDefine borderRadiusSet(BorderRadius value) {
    return this.copyWith(borderRadiusValue: value);
  }

  MRowModifierDefine borderRadiusVertical(double value) {
    return this.copyWith(
        borderRadiusValue: BorderRadius.vertical(
            top: Radius.circular(value), bottom: Radius.circular(value)));
  }

  MRowModifierDefine borderRadiusOnly({
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
  }) {
    return this.copyWith(
      borderRadiusValue: BorderRadius.only(
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight),
        bottomLeft: Radius.circular(bottomLeft),
        bottomRight: Radius.circular(bottomRight),
      ),
    );
  }

  MRowModifierDefine borderRadiusHorizontal(double value) {
    return this.copyWith(
        borderRadiusValue: BorderRadius.horizontal(
            left: Radius.circular(value), right: Radius.circular(value)));
  }

  /// General============End
}
