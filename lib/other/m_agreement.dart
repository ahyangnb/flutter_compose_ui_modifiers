import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../util/log.dart';

class MAgreementText extends StatefulWidget {
  const MAgreementText(
    this.isAgreeTerms, {
    this.selected,
    this.unSelect,
    this.sizeCheckBox,
    this.onTerms,
    this.onPrivacy,
    super.key,
  });

  final RxBool isAgreeTerms;
  final String? selected;
  final String? unSelect;
  final double? sizeCheckBox;
  final VoidCallback? onTerms;
  final VoidCallback? onPrivacy;

  static const String isAgreeTermsKey = "isAgreeTermsKey";

  @override
  State<MAgreementText> createState() => _MAgreementTextState();
}

class _MAgreementTextState extends State<MAgreementText> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    widget.isAgreeTerms.value =
        GetStorage().read(MAgreementText.isAgreeTermsKey) ?? false;
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
        GetStorage()
            .write(MAgreementText.isAgreeTermsKey, widget.isAgreeTerms.value);
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
                      if (widget.selected != null && widget.unSelect != null) {
                        return Image.asset(
                          widget.isAgreeTerms.value
                              ? widget.selected!
                              : widget.unSelect!,
                        ).setSize(sizeUse);
                      }

                      /// Check if selected or unSelect only single one not null
                      if ((widget.selected != null &&
                              widget.unSelect == null) ||
                          (widget.selected == null &&
                              widget.unSelect != null)) {
                        throw Exception(
                            "please set all the checkbox image[selected and unSelect] or all set null.");
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
