import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/config/m_color.dart';
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

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry br = borderRadius ?? BorderRadius.circular(13.px);
    return Container(
      decoration: BoxDecoration(
        borderRadius: br,
        color: onTap == null
            ? MColor.button.disableColor
            : backgroundColor ?? MColor.primaryColor,
        gradient: backgroundGradient ??
            (backgroundColor != null
                ? null
                : MColor.button.primaryBackgroundGradient),
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
              disabledBackgroundColor ?? MColor.button.disableColor,
        ),
        onPressed: onTap,
        child: child ??
            Text(
              text ?? "",
              style: textStyle ??
                  TextStyle(
                    fontSize: fontSize ?? 18.px,
                    color: textColor ?? MColor.button.textColor,
                    fontWeight: fontWeight ?? FontWeight.w600,
                  ),
              textAlign: textAlign,
            ),
      ),
    );
  }
}
