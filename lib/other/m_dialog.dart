import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:flutter_compose_ui_modifiers/other/m_button.dart';
import 'package:get/get.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_compose_ui_modifiers/config/m_str.dart';
import 'package:flutter_compose_ui_modifiers/util/log.dart';

Future<void> mDialogConfirm(
  String title,
  String? description,
  final Future<void> Function() onPressed, {
  final Future<void> Function()? onCancel,
  Widget? centerWidget,
  Widget? desWidget,
  final String? okText,
  final bool showCancel = true,
  required final String tag,
  VoidCallback? onDismiss,
  Color? buttonColor,
  Color? cancelButtonColor,
  Color? bgColor,
  bool? clickMaskDismiss,
}) {
  return mShowSmartDialog(
    onDismiss: onDismiss,
    clickMaskDismiss: clickMaskDismiss,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async => false,
        // Prevent dialog from closing when pressing back button
        child: ConfirmDialogWidget(
          title: title,
          description: description,
          onPressed: onPressed,
          onCancel: onCancel,
          centerWidget: centerWidget,
          desWidget: desWidget,
          okText: okText,
          showCancel: showCancel,
          buttonColor: buttonColor,
          cancelButtonColor: cancelButtonColor,
          bgColor: bgColor,
          tag: tag,
        ),
      );
    },
    tag: tag,
    bindPage: true,
  );
}

class ConfirmDialogWidget extends StatefulWidget {
  const ConfirmDialogWidget({
    super.key,
    required this.title,
    required this.description,
    required this.onPressed,
    required this.onCancel,
    required this.centerWidget,
    required this.desWidget,
    required this.okText,
    required this.buttonColor,
    required this.cancelButtonColor,
    required this.bgColor,
    required this.showCancel,
    required this.tag,
  });

  final String title;
  final String? description;
  final Future<void> Function() onPressed;
  final Future<void> Function()? onCancel;
  final Widget? centerWidget;
  final Widget? desWidget;
  final String? okText;
  final Color? buttonColor;
  final Color? cancelButtonColor;
  final Color? bgColor;
  final bool showCancel;
  final String tag;

  @override
  State<ConfirmDialogWidget> createState() => _ConfirmDialogWidgetState();
}

class _ConfirmDialogWidgetState extends State<ConfirmDialogWidget> {
  @override
  Widget build(BuildContext context) {
    final BorderRadius br = BorderRadius.circular(10.px);

    return Center(
      child: SizedBox(
        width: 317.5.px,
        child: Dialog(
          insetPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: br, // Set border radius here
            side: BorderSide(
                color: Colors.white,
                width: 1.5.px), // Set border color and width here
          ),
          child: ClipRRect(
            borderRadius: br,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20.px, horizontal: 16.px),
              color: widget.bgColor ??
                  MThemeConfig.dialogBgColor ??
                  MThemeConfig.primaryColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    widget.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.px,
                        height: 25.px / 18.px),
                  ),
                  widget.centerWidget ?? Container(),
                  SizedBox(height: 20.px),
                  widget.desWidget ??
                      Text(
                        widget.description ?? '',
                        style: MThemeConfig.desStyle,
                        textAlign: TextAlign.center,
                      ),
                  SizedBox(height: 20.px),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      if (widget.showCancel)
                        Expanded(
                          child: MButtonMiniCancel(
                            onPressed: () async {
                              try {
                                if (widget.onCancel != null) {
                                  await widget.onCancel!();
                                }
                              } finally {
                                await mDismissSmartDialog(tag: widget.tag);
                              }
                            },
                            buttonColor: widget.cancelButtonColor,
                            buttonText: 'Cancel'.tr,
                          ),
                        ),
                      if (widget.showCancel) SizedBox(width: 20.px),
                      Expanded(
                        child: MButtonMini1(
                          onPressed: () async {
                            try {
                              await widget.onPressed();
                            } finally {
                              await mDismissSmartDialog(tag: widget.tag);
                            }
                          },
                          buttonColor: widget.buttonColor,
                          style: TextStyle(
                            fontSize: MThemeConfig.miniButtonTextSize,
                            color: MThemeConfig.miniButtonTextColor ??
                                MThemeConfig.titleColor9,
                          ),
                          buttonText: widget.okText ?? 'Confirm'.tr,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void mDialogCustomConfirmGradient(
  String description,
  final Future<void> Function() onPressed, {
  final Future<void> Function()? onCancel,
  final String? okText,
  required final String tag,
  bool? bindPage,
}) {
  mShowSmartDialog(
    tag: tag,
    builder: (BuildContext context) {
      return MCustomConfirmGradientDialog(
        description: description,
        onPressed: onPressed,
        onCancel: onCancel,
        okText: okText,
        tag: tag,
      );
    },
    bindPage: bindPage,
  );
}

class MCustomConfirmGradientDialog extends StatefulWidget {
  const MCustomConfirmGradientDialog({
    super.key,
    required this.description,
    required this.onPressed,
    required this.onCancel,
    required this.okText,
    required this.tag,
  });

  final String description;
  final Future<void> Function() onPressed;
  final Future<void> Function()? onCancel;
  final String? okText;
  final String tag;

  @override
  State<MCustomConfirmGradientDialog> createState() =>
      _MCustomConfirmGradientDialogState();
}

class _MCustomConfirmGradientDialogState
    extends State<MCustomConfirmGradientDialog> {
  @override
  Widget build(BuildContext context) {
    final BorderRadius br = BorderRadius.circular(26.px);

    return WillPopScope(
      onWillPop: () async => false,
      // Prevent dialog from closing when pressing back button
      child: Column(
        children: <Widget>[
          (200.px - Get.mediaQuery.padding.top).space,
          Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 148.px),
                width: 335.px,
                child: ClipRRect(
                  borderRadius: br,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.px),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[Color(0xffFFCACA), Colors.white],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: <double>[0, 0.3],
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        84.px.space,
                        Text(
                          widget.description,
                          style: TextStyle(
                            color: const Color(0xff333333),
                            fontSize: 18.px,
                            height: 25.px / 18.px,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20.px),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: MButtonMiniCancelGrey(
                                onPressed: () async {
                                  await mDismissSmartDialog(tag: widget.tag);
                                  if (widget.onCancel != null) {
                                    await widget.onCancel!();
                                  } else {
                                    await mDismissSmartDialog(tag: widget.tag);
                                  }
                                },
                                buttonText: 'Cancel'.tr,
                              ),
                            ),
                            SizedBox(width: 41.px),
                            Expanded(
                              child: MButtonMiniGradient(
                                onPressed: () async {
                                  await mDismissSmartDialog(tag: widget.tag);
                                  await widget.onPressed();
                                },
                                buttonText: widget.okText ?? 'Confirm'.tr,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.px),
                      ],
                    ),
                  ),
                ),
              ),
              // Positioned(
              //   top: 0,
              //   left: 33.px,
              //   right: 30.px,
              //   child: MImage(
              //     modifier: MImageModifier.width(311.px).height(222.px),
              //     data: Assets.images2.callEmojiHangUp.path,
              //   ),
              // )
            ],
          ),
        ],
      ).material(),
    );
  }
}

void mDialogAlarmCustomGradient({
  required String description,
  required final Future<void> Function() onPressed,
  String? title,
  final Future<void> Function()? onCancel,
  final String? okText,
  required String tag,
  bool? bindPage,
}) {
  mShowSmartDialog(
    tag: tag,
    builder: (BuildContext context) {
      return MCustomGradientAlarm(
        title: title,
        description: description,
        onPressed: onPressed,
        onCancel: onCancel,
        okText: okText,
        tag: tag,
      );
    },
    bindPage: bindPage,
  );
}

class MCustomGradientAlarm extends StatefulWidget {
  const MCustomGradientAlarm({
    super.key,
    required this.title,
    required this.description,
    required this.onPressed,
    required this.onCancel,
    required this.okText,
    required this.tag,
  });

  final String? title;
  final String description;
  final Future<void> Function() onPressed;
  final Future<void> Function()? onCancel;
  final String? okText;
  final String tag;

  @override
  State<MCustomGradientAlarm> createState() => _MCustomGradientAlarmState();
}

class _MCustomGradientAlarmState extends State<MCustomGradientAlarm> {
  @override
  Widget build(BuildContext context) {
    final BorderRadius br = BorderRadius.circular(26.px);

    return WillPopScope(
      onWillPop: () async => false,
      // Prevent dialog from closing when pressing back button
      child: Column(
        children: <Widget>[
          (174.px - Get.mediaQuery.padding.top).space,
          Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 174.px),
                width: 335.px,
                child: ClipRRect(
                  borderRadius: br,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 28.px),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[Color(0xffFFCACA), Colors.white],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: <double>[0, 0.3],
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        58.px.space,
                        if (widget.title != null) ...<Widget>[
                          MText(
                            modifier: MTextModifier.colorHex(0xffFB0000)
                                .fontSize(20.px),
                            data: widget.title,
                          ),
                          10.px.space,
                        ],
                        Text(
                          widget.description,
                          style: TextStyle(
                            color: const Color(0xff666666),
                            fontSize: 16.px,
                            height: 22.px / 16.px,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.11,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20.px),
                        MButtonMiniGradient(
                          size: Size(235.px, 44.px),
                          onPressed: () async {
                            await mDismissSmartDialog(tag: widget.tag);
                            await widget.onPressed();
                          },
                          buttonText: widget.okText ?? 'Got It'.tr,
                        ),
                        SizedBox(height: 20.px),
                      ],
                    ),
                  ),
                ),
              ),
              // Positioned(
              //   top: 0,
              //   left: 32.px,
              //   right: 31.px,
              //   child: MImage(
              //     modifier: MImageModifier.width(311.px).height(222.px),
              //     data: Assets.images2.callEmojiCompensation.path,
              //   ),
              // )
            ],
          ),
        ],
      ).material(),
    );
  }
}

/// Other dialog please see `mConfirmDialog`.
mDialogCustomConfirm(String title, String content, Function() onConfirm) {
  if (MConfig.mCustomConfirmDialogValue != null) {
    MConfig.mCustomConfirmDialogValue!(title, content, onConfirm);
    return;
  }
  mLogger.d(
      "If you want custom the confirm dialog, please set MConfig.mCustomConfirmDialogValue");
  showDialog(
    context: Get.context!,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(MStr.cancel),
          ),
          TextButton(
            onPressed: onConfirm,
            child: Text(MStr.ok),
          ),
        ],
      );
    },
  );
}

Future<T?> mDialogCupertinoConfirm<T>({
  required String title,
  required VoidCallback onYes,
}) {
  return showCupertinoDialog(
    context: Get.context!,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        // title: const Text('Confirm'),
        content: Text(
          title,
          style: TextStyle(
            color: MThemeConfig.cupertinoDialogTextColor ?? Color(0xff111111),
            fontSize: 17.px,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text('No', style: MThemeConfig.noTextStyle),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: Text('Yes', style: MThemeConfig.yesTextStyle),
            onPressed: () async {
              onYes();
            },
          ),
        ],
      );
    },
  );
}

Future<void> mDialogDarkConfirm(
  String content, {
  String? title,
  String? okText,
  String? bgImage,
  double? width,
  double? height,
  double? textTopSpace,
  double? textBottomSpace,
  required String tag,
  required VoidCallback onConfirm,
}) {
  return mShowSmartDialog(
    builder: (BuildContext context) {
      return MDialogDarkConfirm(
        tag,
        content,
        onConfirm: onConfirm,
        bgImage: bgImage,
        width: width,
        height: height,
        okText: okText,
        textTopSpace: textTopSpace,
        textBottomSpace: textBottomSpace,
      );
    },
    tag: tag,
  );
}

class MDialogDarkConfirm extends StatefulWidget {
  const MDialogDarkConfirm(
    this.tag,
    this.content, {
    required this.onConfirm,
    this.bgImage,
    this.width,
    this.height,
    this.okText,
    this.textTopSpace,
    this.textBottomSpace,
    super.key,
  });

  final String tag;
  final String content;
  final VoidCallback onConfirm;
  final String? bgImage;
  final double? width;
  final double? height;
  final String? okText;
  final double? textTopSpace;
  final double? textBottomSpace;

  @override
  State<MDialogDarkConfirm> createState() => _MDialogDarkConfirmState();
}

class _MDialogDarkConfirmState extends State<MDialogDarkConfirm> {
  void dismiss() => mDismissSmartDialog(tag: widget.tag);

  @override
  Widget build(BuildContext context) {
    final spaceVertical = 28.px;
    DefineMStackModifier modifier =
        MStackModifier.gravity(MGravity.centerVertical).borderRadius(6.px);
    if (widget.bgImage == null) {
      modifier = modifier.backgroundColor(Colors.black).borderAll();
    }
    return MStack(
      modifier: modifier,
      children: [
        if (widget.bgImage != null)
          MImage(
            modifier: MImageModifier.width(widget.width)
                .height(widget.height)
                .fit(BoxFit.cover),
            data: widget.bgImage,
          ),
        MColumn(
          modifier: MColumnModifier.width(widget.width ?? 323.px)
              .height(widget.height),
          children: [
            (widget.textTopSpace ?? spaceVertical).space,
            MText(
              modifier: MTextModifier.colorWhite()
                  .fontSize(16.px)
                  .heightSize(widget.textTopSpace != null ||
                          widget.textBottomSpace != null
                      ? null
                      : 50.px - 28.px + 66.px)
                  .marginHorizontal(30.px)
                  .textCenter()
                  .centerText()
                  .align(Alignment.center),
              data: widget.content,
            ),
            (widget.textBottomSpace ?? spaceVertical).space,
            MRow(
              modifier: MRowModifier.mainCenter(),
              children: [
                MButtonGrey(
                  backgroundColor: Colors.white.withOpacity(0.6),
                  width: 118.px,
                  height: 46.px,
                  textStyle:
                      TextStyle(color: Color(0xff020202), fontSize: 18.px),
                  borderRadius: BorderRadius.all(Radius.circular(4.px)),
                  onTap: () => dismiss(),
                ),
                27.px.space,
                MButton(
                  width: 118.px,
                  height: 46.px,
                  backgroundGradient: MThemeConfig.gradientMain,
                  text: widget.okText ?? "Confirm",
                  textStyle:
                      TextStyle(color: Color(0xff020202), fontSize: 18.px),
                  borderRadius: BorderRadius.all(Radius.circular(4.px)),
                  onTap: () {
                    dismiss();
                    widget.onConfirm();
                  },
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}

Future<T?> mShowTipsDialog<T>(
  BuildContext context, {
  String? centerText,
  Widget? centerWidget,
  String confirmText = 'Confirm',
  required VoidCallback onTap,
  VoidCallback? onCancel,
  VoidCallback? onDismiss,
  bool singleButtonMode = false,
  final Color? okButtonTextColor,
}) async {
  final value = await showDialog<T>(
    context: context,
    barrierDismissible: !singleButtonMode,
    // Prevent dismissing when singleButtonMode is true
    builder: (BuildContext context) {
      return TipsDialog(
        centerText: centerText,
        centerWidget: centerWidget,
        confirmText: confirmText,
        onTap: onTap,
        onCancel: onCancel,
        singleButtonMode: singleButtonMode,
        okButtonTextColor: okButtonTextColor,
      );
    },
  );
  if (value == null && onDismiss != null) {
    onDismiss();
  }
  return value;
}

class TipsDialog extends StatelessWidget {
  final String? centerText;
  final Widget? centerWidget;
  final String confirmText;
  final VoidCallback onTap;
  final VoidCallback? onCancel;
  final bool singleButtonMode;
  final Color? okButtonTextColor;

  TipsDialog({
    this.centerText,
    this.centerWidget,
    required this.confirmText,
    required this.onTap,
    this.onCancel,
    required this.singleButtonMode,
    required this.okButtonTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.px),
      ),
      child: Container(
        width: 270.px,
        padding: EdgeInsets.all(20.px),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Tips',
              style: TextStyle(
                color: Color(0xFF111111),
                fontSize: 18.px,
              ),
            ),
            SizedBox(height: 20.px),
            centerWidget ??
                Text(
                  centerText ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF555555),
                    fontSize: 16.px,
                  ),
                ),
            SizedBox(height: 20.px),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (!singleButtonMode)
                  InkWell(
                    onTap: () {
                      if (onCancel != null) {
                        onCancel!();
                      }
                      Navigator.of(context).pop(false);
                    },
                    child: Container(
                      width: 105.px,
                      height: 39.px,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: Color(0xFF777777), width: 0.5.px),
                        borderRadius: BorderRadius.circular(5.px),
                      ),
                      child: Center(
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: Color(0xFF777777),
                            fontSize: 16.px,
                          ),
                        ),
                      ),
                    ),
                  ),
                if (!singleButtonMode) SizedBox(width: 10.px),
                InkWell(
                  onTap: onTap,
                  child: Container(
                    width: 105.px,
                    height: 39.px,
                    decoration: BoxDecoration(
                      gradient: MThemeConfig.gradientMain,
                      borderRadius: BorderRadius.circular(5.px),
                    ),
                    child: Center(
                      child: Text(
                        confirmText,
                        style: TextStyle(
                          color: okButtonTextColor ?? Colors.white,
                          fontSize: 16.px,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<int?> mDialogSelectDays() async {
  final List<int> daysOptions = [30, 60, 90, 180, 360];
  final String endWith = " days";
  final List<String> useList = daysOptions.map((e) => "$e$endWith").toList();
  final value = await mDialogSelectItemsCupertinoPicker(useList);
  if (value != null) {
    return daysOptions[useList.indexOf(value)];
  }
  return null;
}

Future<T?>? mDialogSelectItemsCupertinoPicker<T>(List<String> options) {
  if (options.isEmpty) {
    myToast('data error');
    return null;
  }
  int selectedIndex = 0;

  return Get.dialog<T>(
    MColumn(
      modifier: MColumnModifier.height(300.px)
          .backgroundColor(Colors.black.withOpacity(0.7))
          .paddingBottom(paddingBottom())
          .gravityBottom()
          .borderTop(color: Colors.white)
          .radiusTop(5.px),
      children: [
        MRow(
          modifier: MRowModifier.mainAxisEnd(),
          children: [
            MButtonSoMiniGradient(
              onPressed: () async {
                Get.back(result: options[selectedIndex]);
              },
              buttonText: "confirm",
              margin: EdgeInsets.all(10.px),
            ),
          ],
        ),
        Expanded(
          child: CupertinoPicker(
            itemExtent: 32.0,
            onSelectedItemChanged: (int index) {
              selectedIndex = index;
            },
            children: options.map((String item) {
              return Center(child: Text(item));
            }).toList(),
          ),
        ),
      ],
    ),
    useSafeArea: false,
  );
}
