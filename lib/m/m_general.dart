// import 'package:flutter/material.dart';
// import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';

// extension FlutterComposeUiModifierMGeneral on Widget {
//   setBackgroundColor(Color backgroundColor) {
//     if (this is MAppBar) {
//       return setAppBarBackgroundColor(backgroundColor);
//     } else if (this is MScaffold) {
//       return setScaffoldBackgroundColor(backgroundColor);
//     }
//     throw Exception('This widget have no xxx method');
//   }
// }

import 'package:flutter/material.dart';

class MGeneralModifier {
  final EdgeInsets? paddingValue;
  final EdgeInsets? marginValue;
  final VoidCallback? onTapValue;
  final Color? backgroundColorValue;
  final BorderRadiusGeometry? borderRadiusValue;
  final bool? centerAlignValue;
  final double? widthValue;
  final double? heightValue;
  final BoxShadow? shadowValue;
  final Matrix4? transformValue;
  final BoxConstraints? constraintsValue;
  final double? aspectRatioValue;
  final int? flexValue;
  final String? helpValue;
  final double? opacityValue;
  final double? rotateValue;
  final double? scaleValue;

  const MGeneralModifier({
    this.paddingValue,
    this.marginValue,
    this.onTapValue,
    this.backgroundColorValue,
    this.borderRadiusValue,
    this.centerAlignValue,
    this.widthValue,
    this.heightValue,
    this.shadowValue,
    this.transformValue,
    this.constraintsValue,
    this.aspectRatioValue,
    this.flexValue,
    this.helpValue,
    this.opacityValue,
    this.rotateValue,
    this.scaleValue,
  });
}

/// if you want to ignore some modifier in general, you can add it here.
enum IgnoreModifierInGeneral { padding, width, height, backgroundColor }

/// [ignoreList]: ignore some modifier in general.
class MGeneralLayoutModifierWidget extends StatelessWidget {
  final MGeneralModifier? generalModifier;
  final List<IgnoreModifierInGeneral> ignoreList;
  final Widget child;

  MGeneralLayoutModifierWidget({
    this.generalModifier,
    required this.child,
    this.ignoreList = const [],
  });

  @override
  Widget build(BuildContext context) {
    Widget child = this.child;
    if (generalModifier == null) {
      return child;
    }
    if (generalModifier?.onTapValue != null) {
      child = InkWell(
        onTap: generalModifier!.onTapValue,
        child: child,
      );
    }
    if (generalModifier?.paddingValue != null ||
        generalModifier?.marginValue != null ||
        generalModifier?.borderRadiusValue != null ||
        generalModifier?.backgroundColorValue != null ||
        generalModifier?.widthValue != null ||
        generalModifier?.heightValue != null ||
        generalModifier?.shadowValue != null) {
      child = Container(
        width: ignoreList.contains(IgnoreModifierInGeneral.width)
            ? null
            : generalModifier?.widthValue,
        height: ignoreList.contains(IgnoreModifierInGeneral.height)
            ? null
            : generalModifier?.heightValue,
        decoration: BoxDecoration(
          color: ignoreList.contains(IgnoreModifierInGeneral.backgroundColor)
              ? null
              : generalModifier?.backgroundColorValue,
          borderRadius: generalModifier?.borderRadiusValue,
          boxShadow: generalModifier?.shadowValue != null
              ? [generalModifier!.shadowValue!]
              : null,
        ),
        padding: ignoreList.contains(IgnoreModifierInGeneral.padding)
            ? null
            : generalModifier?.paddingValue,
        margin: generalModifier?.marginValue,
        child: child,
      );
    }
    if (generalModifier?.centerAlignValue != null &&
        generalModifier!.centerAlignValue!) {
      child = Center(child: child);
    }
    return child;
  }
}
