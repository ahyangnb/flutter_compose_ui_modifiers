import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../util/log.dart';

class MLoginAgreementText extends StatefulWidget {
  const MLoginAgreementText(
    this.isAgreeTerms, {
    this.imgSelected,
    this.imgUnSelect,
    this.sizeCheckBox,
    this.onTerms,
    this.onPrivacy,
    super.key,
  });

  final RxBool isAgreeTerms;
  final String? imgSelected;
  final String? imgUnSelect;
  final double? sizeCheckBox;
  final VoidCallback? onTerms;
  final VoidCallback? onPrivacy;

  static const String isAgreeTermsKey = "isAgreeTermsKey";

  @override
  State<MLoginAgreementText> createState() => _MLoginAgreementTextState();
}

class _MLoginAgreementTextState extends State<MLoginAgreementText> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    widget.isAgreeTerms.value =
        GetStorage().read(MLoginAgreementText.isAgreeTermsKey) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final double lineHeight = 18.5.px / 12.px;
    final TextStyle style = TextStyle(
      color: Colors.white,
      fontSize: 12.px,
      height: lineHeight, // lineHeight = height * fontSize
      /// Must add it even set global theme.
      fontWeight: FontWeight.w600,
    );
    final TextStyle blueStyle = TextStyle(
      color: MThemeConfig.mainColor,
      fontSize: 12.px,
      height: lineHeight,

      /// Must add it even set global theme.
      fontWeight: FontWeight.w600,
    );
    return InkWell(
      onTap: () {
        if (MButtonController.to.isProcessing) {
          mLogger
              .d("It's loading or login processing, ignore the click event.");
          return;
        }
        widget.isAgreeTerms.value = !widget.isAgreeTerms.value;

        /// Auto store the isAgreeTerms state to storage [from manually option].
        GetStorage().write(
            MLoginAgreementText.isAgreeTermsKey, widget.isAgreeTerms.value);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.px, vertical: 10.px),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 31.5.px, right: 5.px),
              child: Container(
                height: 18.5.px,
                width: 12.px,
                padding: EdgeInsets.only(top: 4.px),
                child: Center(
                  child: Obx(
                    () {
                      final sizeUse = widget.sizeCheckBox ?? 12.px;
                      if (widget.imgSelected != null &&
                          widget.imgUnSelect != null) {
                        return Image.asset(
                          widget.isAgreeTerms.value
                              ? widget.imgSelected!
                              : widget.imgUnSelect!,
                        ).setSize(sizeUse);
                      }

                      /// Check if imgSelected or imgUnSelect only single one not null
                      if ((widget.imgSelected != null &&
                              widget.imgUnSelect == null) ||
                          (widget.imgSelected == null &&
                              widget.imgUnSelect != null)) {
                        throw Exception(
                            "please set all the checkbox image[imgSelected and imgUnSelect] or all set null.");
                      }
                      if (widget.isAgreeTerms.value) {
                        return Icon(Icons.check_box, size: sizeUse);
                      } else {
                        return Icon(Icons.check_box_outline_blank,
                            size: sizeUse);
                      }
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: <InlineSpan>[
                    TextSpan(
                      text: '${'By using our App you agree with our'.tr} \n',

                      /// So many TextStyle code can be reduce.
                      style: style,
                    ),
                    TextSpan(
                      text: 'Terms Conditions'.tr,
                      style: blueStyle,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          if (MButtonController.to.isProcessing) {
                            mLogger.d(
                                "It's loading or login processing, ignore the click event.");
                            return;
                          }
                          if (widget.onTerms != null) {
                            widget.onTerms!();
                          }
                        },
                    ),
                    TextSpan(text: ' ${'and'.tr} ', style: style),
                    TextSpan(
                      text: 'Privacy Statement'.tr,
                      style: blueStyle,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          if (MButtonController.to.isProcessing) {
                            mLogger.d(
                                "It's loading or login processing, ignore the click event.");
                            return;
                          }
                          if (widget.onPrivacy != null) {
                            widget.onPrivacy!();
                          }
                          // WebViewPage.toPrivacy();
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MLoginBase extends StatefulWidget {
  final String? imgAppLogo;
  final double? widthOfLogo;
  final String? imgAppName;
  final double? widthOfName;
  final void Function()? onTapLogin;
  final RxBool? isAgreeTerms;
  final String? imgSelected;
  final String? imgUnSelect;
  final double? sizeCheckBox;
  final VoidCallback? onTerms;
  final VoidCallback? onPrivacy;

  MLoginBase({
    this.imgAppLogo,
    this.widthOfLogo,
    this.imgAppName,
    this.widthOfName,
    this.onTapLogin,
    this.isAgreeTerms,
    this.imgSelected,
    this.imgUnSelect,
    this.sizeCheckBox,
    this.onTerms,
    this.onPrivacy,
  });

  @override
  State<MLoginBase> createState() => _MLoginBaseState();
}

class _MLoginBaseState extends State<MLoginBase> {
  RxBool get isAgreeTerms => widget.isAgreeTerms ?? RxBool(false);

  double get widthOfLog => widget.widthOfLogo ?? 120.px;

  double get widthOfName => widget.widthOfName ?? 139.px;

  @override
  Widget build(BuildContext context) {
    return MColumn(
      children: [
        Spacer(),
        if (widget.imgAppLogo == null)
          Container(
            width: widthOfLog,
            height: widthOfLog,
            padding: EdgeInsets.all(10.px),
            decoration: BoxDecoration(
              color: MThemeConfig.mainColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: FlutterLogo(),
          )
        else
          MImage(
            modifier: MImageModifier.widthImage(widthOfLog),
            data: widget.imgAppLogo,
          ),
        17.pxH,
        if (widget.imgAppName == null)
          MText(
            modifier: MTextModifier.fontSize(17.px).colorWhite(),
            data: "Flutter",
          )
        else
          MImage(
            modifier: MImageModifier.width(widthOfName),
            data: widget.imgAppName,
          ),
        Spacer(),
        MButtonGradientBig(
          text: 'Login',
          width: 295.px,
          height: 48.px,
          onTap: () {
            if (widget.onTapLogin != null) {
              widget.onTapLogin!();
            } else {
              myToast("todo");
            }
          },
        ),
        58.pxH,
        MLoginAgreementText(
          isAgreeTerms,
          imgUnSelect: widget.imgUnSelect,
          imgSelected: widget.imgSelected,
          onTerms: widget.onTerms,
          onPrivacy: widget.onPrivacy,
        ),
        58.pxH,
        paddingBottom().spaceH,
      ],
    );
  }
}
