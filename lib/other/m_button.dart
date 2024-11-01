import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/config/m_theme_config.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:flutter_compose_ui_modifiers/util/screen_fit.dart';
import 'package:get/get.dart';

class MButtonGrey extends StatelessWidget {
  MButtonGrey({
    this.backgroundColor,
    this.borderRadius,
    this.width,
    this.height,
    this.textStyle,
    this.text,
    this.onTap,
    this.backgroundGradient,
    this.child,
    this.boxShadow,
    this.border,
    this.disabledBackgroundColor,
    this.padding,
  });

  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final String? text;
  final void Function()? onTap;
  final Gradient? backgroundGradient;
  final Widget? child;
  final List<BoxShadow>? boxShadow;
  final Border? border;
  final Color? disabledBackgroundColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return MButton(
      text: text ?? "Cancel",
      textStyle: textStyle ??
          TextStyle(
            color: const Color(0xff999999),
            fontSize: 18.px,
          ),
      backgroundColor: backgroundColor ?? const Color(0xffF5F5F5),
      borderRadius: borderRadius ?? BorderRadius.circular(27.px),
      width: width ?? 127.px,
      height: height ?? 44.px,
      onTap: () {
        if (onTap != null) {
          onTap!();
        } else {
          Get.back();
        }
      },
      backgroundGradient: backgroundGradient,
      child: child,
      boxShadow: boxShadow,
      border: border,
      disabledBackgroundColor: disabledBackgroundColor,
      padding: padding,
    );
  }
}

class MButtonMini2 extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const MButtonMini2(this.text, {this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return MButton(
      text: text,
      textStyle: TextStyle(color: Colors.white, fontSize: 12.px),
      width: 64.px,
      height: 25.px,
      borderRadius: BorderRadius.all(Radius.circular(17.px)),
      onTap: onTap,
    );
  }
}

class MButton extends StatelessWidget {
  const MButton({
    super.key,
    this.onTap,
    this.text,
    this.width,
    this.height,
    this.maxWidth,
    this.maxHeight,
    this.textStyle,
    this.textColor,
    this.fontWeight,
    this.fontSize,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
    this.backgroundGradient,
    this.child,
    this.boxShadow,
    this.border,
    this.disabledBackgroundColor,
    this.textAlign,
    this.canNotClick = false,
  });

  final void Function()? onTap;
  final String? text;
  final double? width;
  final double? height;
  final double? maxWidth;
  final double? maxHeight;
  final TextStyle? textStyle;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor;
  final Gradient? backgroundGradient;
  final Widget? child;
  final List<BoxShadow>? boxShadow;
  final Border? border;
  final Color? disabledBackgroundColor;
  final TextAlign? textAlign;
  final bool canNotClick;

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry br = borderRadius ?? BorderRadius.circular(13.px);
    return Container(
      decoration: BoxDecoration(
        borderRadius: br,
        color: onTap == null && canNotClick.not()
            ? MThemeConfig.button.disableColor
            : backgroundColor ?? MThemeConfig.primaryColor,
        gradient: backgroundGradient ??
            (backgroundColor != null
                ? null
                : MThemeConfig.button.primaryBackgroundGradient),
        // 阴影
        boxShadow: boxShadow,
        border: border,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: padding,
          minimumSize: Size(width ?? 0, height ?? 0),
          maximumSize:
              Size(maxWidth ?? double.infinity, maxHeight ?? double.infinity),
          shape: RoundedRectangleBorder(
            borderRadius: br,
          ),
          // 外边距
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          disabledBackgroundColor:
              disabledBackgroundColor ?? MThemeConfig.button.disableColor,
          splashFactory: canNotClick ? NoSplash.splashFactory : null,
        ),
        onPressed: canNotClick ? () {} : onTap,
        child: child ??
            Text(
              text ?? "",
              style: textStyle ??
                  TextStyle(
                    fontSize: fontSize ?? 18.px,
                    color: textColor ?? MThemeConfig.button.textColor,
                    fontWeight: fontWeight ?? FontWeight.w600,
                  ),
              textAlign: textAlign,
            ),
      ),
    );
  }
}

class MCommonConfirmThemeButton extends StatelessWidget {
  const MCommonConfirmThemeButton(
      {super.key, required this.buttonText, required this.onPressed});

  final String buttonText;
  final Future<void> Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MCommonConfirmButton(
      buttonText: buttonText,
      textColor: Colors.white,
      onPressed: onPressed,
      buttonColor: MThemeConfig.mainColor,
    );
  }
}

class MCommonConfirmButton extends StatelessWidget {
  MCommonConfirmButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    Color? buttonColor,
    Color? textColor,
    this.borderSide,
    this.size,
    BorderRadius? borderRadius,
    this.style,
    this.gradient,
  })  : textColor = textColor ?? MThemeConfig.titleColor9,
        buttonColor = buttonColor == null && gradient != null
            ? null
            : buttonColor ?? MThemeConfig.assistantColor,
        borderRadius = borderRadius ?? MThemeConfig.buttonBorderRadius8;
  final String buttonText;
  final Future<void> Function()? onPressed;
  final Color? buttonColor;
  final Color textColor;
  final Size? size;
  final BorderRadius borderRadius;
  final TextStyle? style;
  final BorderSide? borderSide;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    final Text container = Text(
      buttonText,
      style: style ??
          TextStyle(
            color: textColor,
            fontSize: 18.px,
          ),
    );
    final Size useSize = size ?? Size(260.px, 49.px);
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: buttonColor != null
            ? MaterialStateProperty.all<Color>(buttonColor!)
            : MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return null; // Use the component's default.
                  }
                  return null; // Use the component's default.
                },
              ),
        fixedSize: MaterialStateProperty.all<Size>(useSize),
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: borderRadius,
            side: borderSide ?? BorderSide.none,
          ),
        ),
        elevation: MaterialStateProperty.all(0),
      ),
      onPressed: () async {
        if (onPressed != null) {
          await onPressed!();
        }
      },
      child: buttonColor != null
          ? container
          : Container(
              width: useSize.width,
              height: useSize.height,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: gradient ?? MThemeConfig.gradientMain,
                borderRadius: borderRadius,
              ),
              child: container,
            ),
    );
  }
}

class MOppositeColorMiniButton extends StatelessWidget {
  const MOppositeColorMiniButton({
    super.key,
    required this.onPressed,
    this.buttonText,
    this.size,
  });

  final Future<void> Function()? onPressed;
  final String? buttonText;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return MButtonMini1(
      buttonText: buttonText ?? '',
      size: size,
      onPressed: onPressed,
      buttonColor: Colors.white,
      style: TextStyle(
        fontSize: MThemeConfig.mediumButtonTextSize,
        color: MThemeConfig.mainColor, // Use buttonColor as textColor
      ),
    );
  }
}

class MButtonMini1 extends StatelessWidget {
  const MButtonMini1({
    super.key,
    required this.onPressed,
    this.buttonText,
    this.buttonColor,
    this.style,
    this.size,
    this.borderRadius,
  });

  final Future<void> Function()? onPressed;
  final String? buttonText;
  final Color? buttonColor;
  final TextStyle? style;
  final Size? size;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return MCommonConfirmButton(
      buttonText: buttonText ?? '',
      style: style ??
          TextStyle(
            fontSize: MThemeConfig.miniButtonTextSize,
            color: MThemeConfig.titleColor9,
          ),
      borderRadius: borderRadius ?? MThemeConfig.miniButtonBorderRadius,
      size: size ?? MThemeConfig.miniButtonSize,
      onPressed: onPressed,
      buttonColor: buttonColor,
    );
  }
}

class MButtonMiniCancel extends StatelessWidget {
  const MButtonMiniCancel({
    super.key,
    required this.onPressed,
    this.buttonText,
    this.buttonColor,
    this.size,
    this.fontSize,
  });

  final Future<void> Function()? onPressed;
  final String? buttonText;
  final Color? buttonColor;
  final Size? size;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return MCommonConfirmButton(
      buttonText: buttonText ?? '',
      style: TextStyle(
        fontSize: fontSize ?? MThemeConfig.miniButtonTextSize,
        color: MThemeConfig.white,
      ),
      borderRadius: MThemeConfig.miniButtonBorderRadius,
      size: size ?? MThemeConfig.miniButtonSize,
      onPressed: onPressed,
      buttonColor: buttonColor ?? MThemeConfig.mainColor,
    );
  }
}

class MButtonMiniCancelGrey extends StatelessWidget {
  const MButtonMiniCancelGrey({
    super.key,
    required this.onPressed,
    this.buttonText,
    this.buttonColor,
    this.size,
    this.fontSize,
  });

  final Future<void> Function()? onPressed;
  final String? buttonText;
  final Color? buttonColor;
  final Size? size;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return MCommonConfirmButton(
      buttonText: buttonText ?? '',
      style: TextStyle(
        fontSize: fontSize ?? MThemeConfig.miniButtonTextSizeInDialog,
        color: MThemeConfig.grey,
      ),
      borderRadius: BorderRadius.all(Radius.circular(27.px)),
      size: size ?? MThemeConfig.miniButtonSizeInDialog,
      onPressed: onPressed,
      buttonColor: buttonColor ?? const Color(0xffF5F5F5),
    );
  }
}

class MButtonMiniGradient extends StatelessWidget {
  const MButtonMiniGradient({
    super.key,
    required this.onPressed,
    this.buttonText,
    this.style,
    this.size,
    this.borderRadius,
    this.backgroundGradient,
    this.backgroundColor,
  });

  final Future<void> Function()? onPressed;
  final String? buttonText;
  final TextStyle? style;
  final Size? size;
  final BorderRadius? borderRadius;
  final Gradient? backgroundGradient;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return MButton(
      backgroundGradient: backgroundGradient ??
          (backgroundColor == null ? MThemeConfig.primaryGradient : null),
      backgroundColor: backgroundColor,
      textStyle: style ??
          TextStyle(
              color: Colors.white,
              fontSize: MThemeConfig.miniButtonTextSizeInDialog),
      onTap: onPressed,
      height: size?.height ?? MThemeConfig.miniButtonSizeInDialog.height,
      width: size?.width ?? MThemeConfig.miniButtonSizeInDialog.width,
      text: buttonText ?? 'Confirm'.tr,
      borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(27.px)),
    );
  }
}

class MButtonSoMiniGradient extends StatelessWidget {
  const MButtonSoMiniGradient(
      {required this.onPressed,
      this.buttonText = 'button',
      this.backgroundGradient,
      this.backgroundColor,
      super.key});

  final String buttonText;
  final Future<void> Function()? onPressed;
  final Gradient? backgroundGradient;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return MButtonMiniGradient(
      onPressed: onPressed,
      buttonText: buttonText,
      style: TextStyle(fontSize: 14.px, color: const Color(0xff020202)),
      size: Size(55.px, 28.px),
      backgroundGradient: backgroundGradient,
      backgroundColor: backgroundColor,
      borderRadius: BorderRadius.all(Radius.circular(4.px)),
    );
  }
}

class MButtonGradientBig extends StatelessWidget {
  final void Function()? onTap;
  final String? text;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor;
  final Gradient? backgroundGradient;
  final Widget? child;
  final List<BoxShadow>? boxShadow;
  final Border? border;
  final Color? disabledBackgroundColor;

  MButtonGradientBig({
    this.onTap,
    this.text,
    this.width,
    this.height,
    this.textStyle,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
    this.backgroundGradient,
    this.child,
    this.boxShadow,
    this.border,
    this.disabledBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return MButton(
      backgroundGradient: backgroundGradient ??
          (backgroundColor == null ? MThemeConfig.gradientMain : null),
      width: width ?? double.infinity,
      height: height ?? 48.px,
      borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(4.px)),
      onTap: onTap,
      text: text ?? 'Button',
      textStyle:
          textStyle ?? TextStyle(color: Color(0xff020202), fontSize: 18.px),
      disabledBackgroundColor: disabledBackgroundColor,
      border: border,
      boxShadow: boxShadow,
      child: child,
      backgroundColor: backgroundColor,
      padding: padding,
    );
  }
}

class MButtonMediumGrey extends StatelessWidget {
  final void Function()? onTap;
  final String? text;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor;
  final Gradient? backgroundGradient;
  final Widget? child;
  final List<BoxShadow>? boxShadow;
  final Border? border;
  final Color? disabledBackgroundColor;
  final EdgeInsetsGeometry? padding;

  MButtonMediumGrey({
    this.onTap,
    this.text,
    this.width,
    this.height,
    this.textStyle,
    this.borderRadius,
    this.backgroundColor,
    this.backgroundGradient,
    this.child,
    this.boxShadow,
    this.border,
    this.disabledBackgroundColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return MButtonGrey(
      text: text ?? 'Button',
      width: width ?? 126.px,
      height: height ?? 32.px,
      textStyle: textStyle ?? TextStyle(color: Colors.black, fontSize: 14.px),
      backgroundColor: backgroundColor ?? Colors.white.withOpacity(0.6),
      borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(4.px)),
      onTap: onTap,
      disabledBackgroundColor: disabledBackgroundColor,
      border: border,
      boxShadow: boxShadow,
      child: child,
      backgroundGradient: backgroundGradient,
      padding: padding,
    );
  }
}

class MButtonMediumGreyBorder extends StatelessWidget {
  final void Function()? onTap;
  final String? text;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor;
  final Gradient? backgroundGradient;
  final Widget? child;
  final List<BoxShadow>? boxShadow;
  final Color? disabledBackgroundColor;
  final EdgeInsetsGeometry? padding;
  final Color? borderColor;
  final double? borderWidth;

  MButtonMediumGreyBorder({
    this.onTap,
    this.text,
    this.width,
    this.height,
    this.textStyle,
    this.borderRadius,
    this.backgroundColor,
    this.backgroundGradient,
    this.child,
    this.boxShadow,
    this.disabledBackgroundColor,
    this.padding,
    this.borderColor,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return MButtonMediumGrey(
      border: Border.all(
          color: borderColor ?? Colors.black, width: borderWidth ?? 1.px),
      onTap: onTap,
      text: text,
      width: width,
      height: height,
      textStyle: textStyle,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      backgroundGradient: backgroundGradient,
      child: child,
      boxShadow: boxShadow,
      disabledBackgroundColor: disabledBackgroundColor,
      padding: padding,
    );
  }
}

class MButtonMediumThemeBorder extends StatelessWidget {
  final void Function()? onTap;
  final String? text;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor;
  final Gradient? backgroundGradient;
  final Widget? child;
  final List<BoxShadow>? boxShadow;
  final Border? border;
  final Color? disabledBackgroundColor;
  final EdgeInsetsGeometry? padding;

  MButtonMediumThemeBorder({
    this.onTap,
    this.text,
    this.width,
    this.height,
    this.textStyle,
    this.borderRadius,
    this.backgroundColor,
    this.backgroundGradient,
    this.child,
    this.boxShadow,
    this.border,
    this.disabledBackgroundColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return MButtonGrey(
      text: text ?? 'Button',
      width: width ?? 126.px,
      height: height ?? 32.px,
      textStyle: textStyle ?? TextStyle(color: Colors.black, fontSize: 14.px),
      backgroundColor: backgroundColor ?? MThemeConfig.primaryColor,
      borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(4.px)),
      onTap: onTap,
      disabledBackgroundColor: disabledBackgroundColor,
      border: border ?? Border.all(color: Colors.black, width: 1.px),
      boxShadow: boxShadow,
      child: child,
      backgroundGradient: backgroundGradient,
      padding: padding,
    );
  }
}
