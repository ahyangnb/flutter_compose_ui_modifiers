import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:get/get.dart';

import '../util/toast.dart';

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
