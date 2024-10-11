import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/config/m_theme_config.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:flutter_compose_ui_modifiers/util/screen_fit.dart';
import 'package:get/get.dart';

class MButtonGrey extends StatelessWidget {
  const MButtonGrey({super.key});

  @override
  Widget build(BuildContext context) {
    return MButton(
      text: "Cancel",
      textStyle: TextStyle(
        color: const Color(0xff999999),
        fontSize: 18.px,
      ),
      backgroundColor: const Color(0xffF5F5F5),
      borderRadius: BorderRadius.circular(27.px),
      width: 127.px,
      height: 44.px,
      onTap: () => Get.back(),
    );
  }
}

class MButtonMini extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const MButtonMini(this.text, {this.onTap, super.key});

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
  final Future<void> Function() onPressed;
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
        await onPressed();
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

  final Future<void> Function() onPressed;
  final String? buttonText;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return MMiniButton(
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

class MMiniButton extends StatelessWidget {
  const MMiniButton({
    super.key,
    required this.onPressed,
    this.buttonText,
    this.buttonColor,
    this.style,
    this.size,
    this.borderRadius,
  });

  final Future<void> Function() onPressed;
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

class MMiniCancelButton extends StatelessWidget {
  const MMiniCancelButton({
    super.key,
    required this.onPressed,
    this.buttonText,
    this.buttonColor,
    this.size,
    this.fontSize,
  });

  final Future<void> Function() onPressed;
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

class MMiniCancelGreyButton extends StatelessWidget {
  const MMiniCancelGreyButton({
    super.key,
    required this.onPressed,
    this.buttonText,
    this.buttonColor,
    this.size,
    this.fontSize,
  });

  final Future<void> Function() onPressed;
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

class MMiniGradientButton extends StatelessWidget {
  const MMiniGradientButton({
    super.key,
    required this.onPressed,
    this.buttonText,
    this.style,
    this.size,
    this.borderRadius,
  });

  final Future<void> Function() onPressed;
  final String? buttonText;
  final TextStyle? style;
  final Size? size;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return MButton(
      backgroundGradient: MThemeConfig.primaryGradient,
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
