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
        width: modifier?.widthValue ?? 86,
        height: modifier?.heightValue ?? 86,
        decoration: BoxDecoration(
          color: modifier?.backgroundColorValue ?? const Color(0xffF8F8F8),
          borderRadius:
              modifier?.borderRadiusValue ?? BorderRadius.circular(43),
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
  MAddButtonModifierDefine copyWith({
    double? iconSizeValue,
    Color? iconColorValue,

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
    return MAddButtonModifierDefine(
      iconSizeValue: iconSizeValue ?? this.iconSizeValue,
      iconColorValue: iconColorValue ?? this.iconColorValue,

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
    return this.copyWith(shadowValue: value);
  }

  MAddButtonModifierDefine shadowDef({Color? color}) {
    final value = BoxShadow(
      color: color ?? Color(0xff000000).withOpacity(0.1),
      offset: const Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    );
    return this.copyWith(shadowValue: value);
  }

  MAddButtonModifierDefine padding(EdgeInsets value) {
    return setPadding(value);
  }

  MAddButtonModifierDefine setPadding(EdgeInsets? value) {
    return this.copyWith(
      paddingValue: value ?? this.paddingValue ?? EdgeInsets.zero,
    );
  }

  MAddButtonModifierDefine paddingTop(double value) {
    return setPaddingTop(value);
  }

  MAddButtonModifierDefine setPaddingTop(double value) {
    return this.copyWith(
      paddingValue: (this.paddingValue ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  MAddButtonModifierDefine paddingHorizontal(double value) {
    return setPaddingHorizontal(value);
  }

  MAddButtonModifierDefine setPaddingHorizontal(double value) {
    return this.copyWith(
      paddingValue: (this.paddingValue ?? EdgeInsets.zero)
          .copyWith(left: value, right: value),
    );
  }

  MAddButtonModifierDefine paddingVertical(double value) {
    return setPaddingVertical(value);
  }

  MAddButtonModifierDefine setPaddingVertical(double value) {
    return this.copyWith(
      paddingValue: (this.paddingValue ?? EdgeInsets.zero)
          .copyWith(top: value, bottom: value),
    );
  }

  MAddButtonModifierDefine paddingBottom(double value) {
    return this.copyWith(
      paddingValue:
          (this.paddingValue ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  MAddButtonModifierDefine marginTop(double value) {
    return this.copyWith(
      marginValue: (this.marginValue ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  MAddButtonModifierDefine marginBottom(double value) {
    return this.copyWith(
      marginValue:
          (this.marginValue ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  MAddButtonModifierDefine margin(EdgeInsets? marginValue) {
    return this.copyWith(marginValue: marginValue);
  }

  MAddButtonModifierDefine backgroundColor(Color? value) {
    return this.copyWith(backgroundColorValue: value);
  }

  MAddButtonModifierDefine center(bool value) {
    return this.copyWith(centerAlignValue: value);
  }

  MAddButtonModifierDefine size(Size value) {
    return this.copyWith(widthValue: value.width, heightValue: value.height);
  }

  MAddButtonModifierDefine width(double? value) {
    return this.copyWith(widthValue: value);
  }

  MAddButtonModifierDefine height(double? value) {
    return this.copyWith(heightValue: value);
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

  MAddButtonModifierDefine setClick(VoidCallback onTapValue) {
    return this.copyWith(onTapValue: onTapValue);
  }

  MAddButtonModifierDefine borderRadius(double value) {
    return this.copyWith(borderRadiusValue: BorderRadius.circular(value));
  }

  MAddButtonModifierDefine borderRadiusVertical(double value) {
    return this.copyWith(
        borderRadiusValue: BorderRadius.vertical(
            top: Radius.circular(value), bottom: Radius.circular(value)));
  }

  MAddButtonModifierDefine borderRadiusHorizontal(double value) {
    return this.copyWith(
        borderRadiusValue: BorderRadius.horizontal(
            left: Radius.circular(value), right: Radius.circular(value)));
  }

  /// General============End
}
