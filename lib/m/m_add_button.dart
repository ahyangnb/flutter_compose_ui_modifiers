import 'package:flutter/cupertino.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';

class MAddButton extends StatelessWidget {
  final MAddButtonModifierDefine? modifier;
  final List<Widget>? children;

  MAddButton({
    this.children,
    this.modifier,
  });

  @override
  Widget build(BuildContext context) {
    return MGeneralLayoutModifierWidget(
      generalModifier: modifier,
      ignoreList: [
        IgnoreModifierInGeneral.width,
        IgnoreModifierInGeneral.height,
        IgnoreModifierInGeneral.backgroundColor,
      ],
      child: Container(
        width: modifier?.valueWidth ?? 86,
        height: modifier?.valueHeight ?? 86,
        decoration: BoxDecoration(
          color: modifier?.valueBackgroundColor ?? const Color(0xffF8F8F8),
          borderRadius:
              modifier?.valueBorderRadius ?? BorderRadius.circular(43),
        ),
        child: Icon(CupertinoIcons.add,
            size: modifier?.iconSizeValue ?? 25,
            color: modifier?.iconColorValue ?? const Color(0xff949494)),
      ),
    );
  }
}

final MAddButtonModifier = MAddButtonModifierDefine();

class MAddButtonModifierDefine extends MGeneralModifier {
  final double? iconSizeValue;
  final Color? iconColorValue;

  const MAddButtonModifierDefine({
    this.iconSizeValue,
    this.iconColorValue,
    super.valuePadding,
    super.valueMargin,
    super.valueOnTap,
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
  });

  /// Create a copyWith().
  MAddButtonModifierDefine copyWith({
    double? iconSizeValue,
    Color? iconColorValue,

    /// The following properties are inherited from MGeneralModifier.
    EdgeInsets? valuePadding,
    EdgeInsets? valueMargin,
    GestureTapCallback? valueOnTap,
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
  }) {
    return MAddButtonModifierDefine(
      iconSizeValue: iconSizeValue ?? this.iconSizeValue,
      iconColorValue: iconColorValue ?? this.iconColorValue,

      /// The following properties are inherited from MGeneralModifier.
      valuePadding: valuePadding ?? this.valuePadding,
      valueMargin: valueMargin ?? this.valueMargin,
      valueOnTap: valueOnTap ?? this.valueOnTap,
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
    );
  }
}

extension MAddButtonModifierPropertys on MAddButtonModifierDefine {
  MAddButtonModifierDefine iconSize(double value) {
    return this.copyWith(iconSizeValue: value);
  }

  MAddButtonModifierDefine iconColor(Color value) {
    return this.copyWith(iconColorValue: value);
  }

  /// General============Start
  ///
  MAddButtonModifierDefine shadow(BoxShadow value) {
    return this.copyWith(valueShadow: value);
  }

  MAddButtonModifierDefine shadowDef({Color? color}) {
    final value = BoxShadow(
      color: color ?? Color(0xff000000).withOpacity(0.1),
      offset: const Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    );
    return this.copyWith(valueShadow: value);
  }

  MAddButtonModifierDefine padding(double value) {
    return setPaddingEdge(EdgeInsets.all(value));
  }

  MAddButtonModifierDefine paddingSet(EdgeInsets value) {
    return setPaddingEdge(value);
  }

  MAddButtonModifierDefine setPaddingEdge(EdgeInsets? value) {
    return this.copyWith(
      valuePadding: value ?? this.valuePadding ?? EdgeInsets.zero,
    );
  }

  MAddButtonModifierDefine paddingTop(double value) {
    return setPaddingTop(value);
  }

  MAddButtonModifierDefine setPaddingTop(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  MAddButtonModifierDefine paddingHorizontal(double value) {
    return setPaddingHorizontal(value);
  }

  MAddButtonModifierDefine setPaddingHorizontal(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero)
          .copyWith(left: value, right: value),
    );
  }

  MAddButtonModifierDefine paddingVertical(double value) {
    return setPaddingVertical(value);
  }

  MAddButtonModifierDefine setPaddingVertical(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero)
          .copyWith(top: value, bottom: value),
    );
  }

  MAddButtonModifierDefine paddingBottom(double value) {
    return this.copyWith(
      valuePadding:
          (this.valuePadding ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  MAddButtonModifierDefine marginTop(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  MAddButtonModifierDefine marginBottom(double value) {
    return this.copyWith(
      valueMargin:
          (this.valueMargin ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  MAddButtonModifierDefine marginLeft(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(left: value),
    );
  }

  MAddButtonModifierDefine marginRight(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(right: value),
    );
  }

  MAddButtonModifierDefine marginHorizontal(double value) {
    return marginSymmetric(horizontal: value);
  }

  MAddButtonModifierDefine marginVertical(double value) {
    return marginSymmetric(vertical: value);
  }

  MAddButtonModifierDefine marginSymmetric(
      {double? horizontal, double? vertical}) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(
        left: horizontal ?? this.valueMargin?.left,
        right: horizontal ?? this.valueMargin?.right,
        top: vertical ?? this.valueMargin?.top,
        bottom: vertical ?? this.valueMargin?.bottom,
      ),
    );
  }

  MAddButtonModifierDefine marginOnly({
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(
        left: left ?? this.valueMargin?.left,
        right: right ?? this.valueMargin?.right,
        top: top ?? this.valueMargin?.top,
        bottom: bottom ?? this.valueMargin?.bottom,
      ),
    );
  }

  MAddButtonModifierDefine marginSet(EdgeInsets? value) {
    return this.copyWith(valueMargin: value);
  }

  MAddButtonModifierDefine margin(double? value) {
    return this.copyWith(valueMargin: EdgeInsets.all(value ?? 0));
  }

  MAddButtonModifierDefine backgroundColor(Color? value) {
    return this.copyWith(valueBackgroundColor: value);
  }

  MAddButtonModifierDefine center(bool value) {
    return this.copyWith(valueCenterAlign: value);
  }

  MAddButtonModifierDefine size(Size value) {
    return this.copyWith(valueWidth: value.width, valueHeight: value.height);
  }

  MAddButtonModifierDefine width(double? value) {
    return this.copyWith(valueWidth: value);
  }

  MAddButtonModifierDefine height(double? value) {
    return this.copyWith(valueHeight: value);
  }

  MAddButtonModifierDefine onTap(VoidCallback onTap) {
    return setClick(onTap);
  }

  MAddButtonModifierDefine onClick(VoidCallback onTap) {
    return setClick(onTap);
  }

  MAddButtonModifierDefine click(VoidCallback onTap) {
    return setClick(onTap);
  }

  MAddButtonModifierDefine setClick(VoidCallback valueOnTap) {
    return this.copyWith(valueOnTap: valueOnTap);
  }

  MAddButtonModifierDefine borderRadius(double value) {
    return this.copyWith(valueBorderRadius: BorderRadius.circular(value));
  }

  MAddButtonModifierDefine borderRadiusSet(BorderRadius value) {
    return this.copyWith(valueBorderRadius: value);
  }

  MAddButtonModifierDefine borderRadiusVertical(double value) {
    return this.copyWith(
        valueBorderRadius: BorderRadius.vertical(
            top: Radius.circular(value), bottom: Radius.circular(value)));
  }

  MAddButtonModifierDefine borderRadiusOnly({
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
  }) {
    return this.copyWith(
      valueBorderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight),
        bottomLeft: Radius.circular(bottomLeft),
        bottomRight: Radius.circular(bottomRight),
      ),
    );
  }

  MAddButtonModifierDefine borderRadiusHorizontal(double value) {
    return this.copyWith(
        valueBorderRadius: BorderRadius.horizontal(
            left: Radius.circular(value), right: Radius.circular(value)));
  }

  /// General============End
}
