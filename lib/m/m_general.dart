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

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/custom/m_dragble.dart';
import 'package:flutter_compose_ui_modifiers/custom/gradient_box_border.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:get/get.dart';

enum MGravity {
  top,
  centerVertical,
  bottom,
  left,
  centerHorizontal,
  right,
}

extension ExtensionMGravity on MGravity {
  bool get isVertical {
    return this == MGravity.top ||
        this == MGravity.centerVertical ||
        this == MGravity.bottom;
  }
}

class MGeneralModifier {
  /// Main key.
  final Key? valueKey;

  /// Contents:
  final EdgeInsets? valuePadding;
  final EdgeInsets? valueMargin;
  final VoidCallback? valueOnTap;
  final GestureLongPressCallback? valueOnLongPress;
  final GestureLongPressMoveUpdateCallback? valueOnLongPressMoveUpdate;
  final GestureLongPressUpCallback? valueOnLongPressUp;
  final VoidCallback? valueDragOutToStatusBar;
  final Color? valueBackgroundColor;
  final BorderRadiusGeometry? valueBorderRadius;
  final bool? valueCenterAlign;
  final double? valueWidth;
  final double? valueHeight;
  final BoxShadow? valueShadow;
  final Matrix4? valueTransform;
  final BoxConstraints? valueConstraints;
  final double? valueAspectRatio;
  final int? valueFlex;
  final bool? valueOutSizeFlex;
  final String? valueHelp;
  final double? valueOpacity;
  final double? valueRotate;
  final double? valueScale;
  final Gradient? valueGradient;
  final Border? valueBorder;
  final BoxShape? valueShape;
  final String? valueBackgroundImage;
  final BoxFit? valueBackgroundImageFit;
  final MGravity? valueGravity;
  final AlignmentGeometry? valueContainerAlignment;
  final AlignmentGeometry? valueOutSideAlignment;
  final bool? valueCancelFocusWhenClick;
  final Color? valueOutSideBackgroundColor;
  final BorderRadiusGeometry? valueOutSideBorderRadius;

  // If it doesn't work, set the fullWidth or fullHeight.
  final Gradient? valueGradientBorder;
  final double? valueGradientBorderSize;
  final double? valueFullWidth;
  final double? valueFullHeight;

  /// Use the Positioned widget.
  final double? valueLeft;
  final double? valueRight;
  final double? valueTop;
  final double? valueBottom;

  /// Scroll.
  final bool? valueScrollable;
  final ScrollController? valueScrollController;
  final VoidCallback? valueOnScrollStop;

  /// Blur
  final double? valueSigmaX;
  final double? valueSigmaY;
  final Color? valueMaskColor;

  /// Material
  final MaterialType? valueMaterialType;
  final double? valueMaterialElevation;

  /// Other
  final SafeArea? valueSafeArea;
  final bool? valueVisible;
  final int? valueTabLength;

  /// Only refresh `builder` content.
  final Rx<dynamic>? valueObxListener;

  const MGeneralModifier({
    /// Main key.
    this.valueKey,

    /// Contents:
    this.valuePadding,
    this.valueMargin,
    this.valueOnTap,
    this.valueOnLongPress,
    this.valueOnLongPressMoveUpdate,
    this.valueOnLongPressUp,
    this.valueDragOutToStatusBar,
    this.valueBackgroundColor,
    this.valueBorderRadius,
    this.valueCenterAlign,
    this.valueWidth,
    this.valueHeight,
    this.valueShadow,
    this.valueTransform,
    this.valueConstraints,
    this.valueAspectRatio,
    this.valueFlex,
    this.valueOutSizeFlex,
    this.valueHelp,
    this.valueOpacity,
    this.valueRotate,
    this.valueScale,
    this.valueGradient,
    this.valueBorder,
    this.valueShape,
    this.valueBackgroundImage,
    this.valueBackgroundImageFit,
    this.valueGravity,
    this.valueGradientBorder,
    this.valueGradientBorderSize,
    this.valueFullWidth,
    this.valueFullHeight,
    this.valueContainerAlignment,
    this.valueOutSideAlignment,
    this.valueCancelFocusWhenClick,
    this.valueOutSideBackgroundColor,
    this.valueOutSideBorderRadius,

    /// Use the Positioned widget.
    this.valueLeft,
    this.valueRight,
    this.valueTop,
    this.valueBottom,

    /// Scroll.
    this.valueScrollable,
    this.valueScrollController,
    this.valueOnScrollStop,

    /// Blur.
    this.valueSigmaX,
    this.valueSigmaY,
    this.valueMaskColor,

    /// Material
    this.valueMaterialType,
    this.valueMaterialElevation,

    /// Other
    this.valueSafeArea,
    this.valueVisible,
    this.valueTabLength,
    this.valueObxListener,
  });
}

/// if you want to ignore some modifier in general, you can add it here.
enum IgnoreModifierInGeneral {
  padding,
  width,
  height,
  backgroundColor,
  borderRadius,
  alignment
}

/// [ignoreList]: ignore some modifier in general.
class MGeneralLayoutModifierWidget extends StatelessWidget {
  final MGeneralModifier? generalModifier;
  final List<IgnoreModifierInGeneral> ignoreList;
  final Widget child;

  MGeneralLayoutModifierWidget({
    this.generalModifier,
    required this.child,
    this.ignoreList = const [],
    // required super.key,
  });

  @override
  Widget build(BuildContext context) {
    Widget child = this.child;
    if (generalModifier == null) {
      return child;
    }
    if (generalModifier?.valuePadding != null ||
        generalModifier?.valueMargin != null ||
        generalModifier?.valueBorderRadius != null ||
        generalModifier?.valueBackgroundColor != null ||
        generalModifier?.valueWidth != null ||
        generalModifier?.valueHeight != null ||
        generalModifier?.valueTransform != null ||
        generalModifier?.valueShadow != null ||
        generalModifier?.valueGradient != null ||
        generalModifier?.valueGradientBorder != null ||
        generalModifier?.valueBorder != null ||
        generalModifier?.valueConstraints != null ||
        generalModifier?.valueContainerAlignment != null ||
        generalModifier?.valueShape != null ||
        generalModifier?.valueBackgroundImage != null) {
      child = AnimatedContainer(
        width: ignoreList.contains(IgnoreModifierInGeneral.width)
            ? null
            : generalModifier?.valueWidth,
        height: ignoreList.contains(IgnoreModifierInGeneral.height)
            ? null
            : generalModifier?.valueHeight,
        transform: generalModifier?.valueTransform,
        constraints: generalModifier?.valueConstraints,
        alignment: ignoreList.contains(IgnoreModifierInGeneral.alignment)
            ? null
            : generalModifier?.valueContainerAlignment,
        decoration: BoxDecoration(
          color: ignoreList.contains(IgnoreModifierInGeneral.backgroundColor)
              ? null
              : generalModifier?.valueBackgroundColor,
          borderRadius:
              ignoreList.contains(IgnoreModifierInGeneral.borderRadius)
                  ? null
                  : generalModifier?.valueBorderRadius,
          boxShadow: generalModifier?.valueShadow != null
              ? [generalModifier!.valueShadow!]
              : null,
          gradient: generalModifier?.valueGradient,
          border: generalModifier?.valueGradientBorder != null
              ? GradientBoxBorder(
                  gradient: generalModifier!.valueGradientBorder!,
                  width: generalModifier?.valueGradientBorderSize ?? 1.0)
              : generalModifier?.valueBorder,
          shape: generalModifier?.valueShape ?? BoxShape.rectangle,
          image: generalModifier?.valueBackgroundImage != null
              ? DecorationImage(
                  image:
                      mGetImageProvider(generalModifier!.valueBackgroundImage!),
                  fit: generalModifier?.valueBackgroundImageFit,
                )
              : null,
        ),
        padding: ignoreList.contains(IgnoreModifierInGeneral.padding)
            ? null
            : generalModifier?.valuePadding,
        margin: generalModifier?.valueMargin,
        duration: Duration(milliseconds: 300),
        child: child,
      );
    }

    /// Double border radius clip can really makes ui perfect.
    if (generalModifier?.valueBorderRadius != null &&
        ignoreList.contains(IgnoreModifierInGeneral.borderRadius).not()) {
      child = ClipRRect(
        borderRadius: generalModifier!.valueBorderRadius!,
        child: child,
      );
    }

    if (generalModifier?.valueOutSideAlignment != null) {
      child = Container(
        alignment: generalModifier?.valueOutSideAlignment,
        child: child,
      );
    }

    if (generalModifier?.valueFullWidth != null ||
        generalModifier?.valueFullHeight != null) {
      child = SizedBox(
        width: generalModifier?.valueFullWidth,
        height: generalModifier?.valueFullHeight,
        child: child,
      );
    }

    /// Must use the InkWell in before last one.
    /// otherwise the event will not be triggered in some area such as margin.
    if (generalModifier?.valueOnTap != null ||
        generalModifier?.valueOnLongPress != null ||
        generalModifier?.valueOnLongPressMoveUpdate != null ||
        generalModifier?.valueOnLongPressUp != null ||
        generalModifier?.valueCancelFocusWhenClick != null) {
      child = GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          if (generalModifier?.valueCancelFocusWhenClick != null &&
              generalModifier!.valueCancelFocusWhenClick!) {
            FocusScope.of(context).requestFocus(FocusNode());
          }
          if (generalModifier?.valueOnTap != null) {
            generalModifier!.valueOnTap!();
          }
        },
        onLongPress: generalModifier?.valueOnLongPress,
        onLongPressMoveUpdate: generalModifier?.valueOnLongPressMoveUpdate,
        onLongPressUp: generalModifier?.valueOnLongPressUp,
        child: child,
      );
    }

    if (generalModifier?.valueOpacity != null) {
      child = Opacity(opacity: generalModifier!.valueOpacity!, child: child);
    }

    if (generalModifier?.valueSigmaX != null ||
        generalModifier?.valueSigmaY != null) {
      if (generalModifier is DefineMImageModifier) {
        child = ClipRRect(
          borderRadius: generalModifier?.valueBorderRadius ?? BorderRadius.zero,
          child: ImageFiltered(
            imageFilter: ImageFilter.compose(
              // Blur.
              // 模糊
              outer: ImageFilter.blur(
                sigmaX: generalModifier?.valueSigmaX ?? 0,
                sigmaY: generalModifier?.valueSigmaY ?? 0,
              ),
              // tilt
              // 倾斜
              inner: ImageFilter.matrix(Matrix4.skewY(0).storage),
            ),
            child: child,
          ),
        );
      } else {
        child = ClipRRect(
          borderRadius: generalModifier?.valueBorderRadius ?? BorderRadius.zero,
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: generalModifier?.valueSigmaX ?? 0,
              sigmaY: generalModifier?.valueSigmaY ?? 0,
            ),
            child: child,
          ),
        );
      }
    }

    if (generalModifier?.valueMaskColor != null) {
      child = Stack(
        children: [
          child,
          Container(color: generalModifier!.valueMaskColor!),
        ],
      );
    }

    if (generalModifier?.valueMaterialType != null ||
        generalModifier?.valueMaterialElevation != null) {
      child = Material(
        type: generalModifier?.valueMaterialType ?? MaterialType.transparency,
        elevation: generalModifier?.valueMaterialElevation ?? 0,
        child: child,
      );
    }

    if (generalModifier?.valueCenterAlign != null &&
        generalModifier!.valueCenterAlign!) {
      child = Center(child: child);
    }

    if (generalModifier?.valueGravity != null &&
        generalModifier!.valueGravity!.isVertical) {
      final gravityValue =
          generalModifier!.valueGravity == MGravity.centerVertical
              ? MainAxisAlignment.center
              : generalModifier!.valueGravity == MGravity.top
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.end;
      child = Column(mainAxisAlignment: gravityValue, children: [child]);
    }

    if (generalModifier?.valueGravity != null &&
        generalModifier!.valueGravity!.isVertical.not()) {
      final gravityValue =
          generalModifier!.valueGravity == MGravity.centerHorizontal
              ? MainAxisAlignment.center
              : generalModifier!.valueGravity == MGravity.left
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.end;
      child = Row(mainAxisAlignment: gravityValue, children: [child]);
    }

    if (generalModifier?.valueDragOutToStatusBar != null) {
      if (generalModifier?.valueHeight == null) {
        throw Exception("generalModifier?.valueHeight must not be null.");
      }
      child = MDragOut(
        height: generalModifier!.valueHeight!,
        child: child,
        onDismiss: generalModifier!.valueDragOutToStatusBar!,
      );
    }

    /// Current Widget is not scrollable.
    if (generalModifier is! DefineMListViewModifier &&
        generalModifier is! DefineMTextFieldModifier) {
      if ((generalModifier?.valueScrollable ?? false) ||
          generalModifier?.valueScrollController != null) {
        child = MScrollWidget(child, generalModifier!);
      }
    }

    if (generalModifier?.valueSafeArea != null) {
      child = SafeArea(
        top: generalModifier?.valueSafeArea?.top ?? true,
        bottom: generalModifier?.valueSafeArea?.bottom ?? true,
        left: generalModifier?.valueSafeArea?.left ?? true,
        right: generalModifier?.valueSafeArea?.right ?? true,
        child: child,
      );
    }

    if (generalModifier?.valueVisible != null) {
      child = AnimatedCrossFade(
        firstChild: child,
        secondChild: Container(),
        crossFadeState: generalModifier!.valueVisible!
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        duration: Duration(milliseconds: 300),
      );
    }

    if (generalModifier?.valueTabLength != null) {
      child = DefaultTabController(
          length: generalModifier!.valueTabLength!, child: child);
    }

    if (generalModifier?.valueOutSideBackgroundColor != null ||
        generalModifier?.valueOutSideBorderRadius != null) {
      child = Container(
        decoration: BoxDecoration(
          color: generalModifier?.valueOutSideBackgroundColor,
          borderRadius: generalModifier?.valueOutSideBorderRadius,
        ),
        child: child,
      );
      if (generalModifier?.valueOutSideBorderRadius != null) {
        child = ClipRRect(
          borderRadius: generalModifier!.valueOutSideBorderRadius!,
          child: child,
        );
      }
    }

    /// Must use it in last one.
    if (generalModifier?.valueFlex != null ||
        generalModifier?.valueOutSizeFlex != null) {
      if (child is Positioned) {
        throw Exception('The Positioned widget can not use Expanded widget');
      }
      if (generalModifier?.valueOutSizeFlex ?? false) {
        child = Align(
          alignment: Alignment.topLeft,
          child: child,
        );
      }
      child = Expanded(flex: generalModifier?.valueFlex ?? 1, child: child);
    }

    if (generalModifier?.valueLeft != null ||
        generalModifier?.valueRight != null ||
        generalModifier?.valueTop != null ||
        generalModifier?.valueBottom != null) {
      child = Positioned(
        left: generalModifier?.valueLeft,
        right: generalModifier?.valueRight,
        top: generalModifier?.valueTop,
        bottom: generalModifier?.valueBottom,
        child: child,
      );
    }

    return child;
  }
}

extension OkExtentionOfGeneal on MGeneralModifier {
  double get getFullSizeWidth => getFullSize.width;

  double get getFullSizeHeight => getFullSize.height;

  double get getFullPaddingHorizontal =>
      (valueMargin?.left ?? 0) + (valueMargin?.right ?? 0);

  double get getFullPaddingVertical =>
      (valueMargin?.top ?? 0) + (valueMargin?.bottom ?? 0);

  Size get getFullSize {
    final _width = (valueWidth ?? 0) + getFullPaddingHorizontal;
    final _height = (valueHeight ?? 0) + getFullPaddingVertical;
    return Size(_width, _height);
  }
}

class MScrollWidget extends StatefulWidget {
  final Widget child;
  final MGeneralModifier generalModifier;

  const MScrollWidget(this.child, this.generalModifier, {super.key});

  @override
  State<MScrollWidget> createState() => _MScrollWidgetState();
}

class _MScrollWidgetState extends ModifierState<MScrollWidget>
    with AutoOnScrollStop {
  @override
  late ScrollController useController =
      widget.generalModifier.valueScrollController ?? ScrollController();

  @override
  VoidCallback? get valueOnScrollStop =>
      widget.generalModifier.valueOnScrollStop;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: widget.child,
      controller: useController,
    );
  }
}

mixin ObxImplementation<T extends StatefulWidget> on ModifierState<T> {
  Rx<dynamic>? get valueObxListener;

  @override
  void initState() {
    super.initState();
    if (valueObxListener != null) {
      everAndAutoClose(valueObxListener!, (callback) {
        if (mounted) {
          setState(() {});
        }
      });
    }
  }
}
