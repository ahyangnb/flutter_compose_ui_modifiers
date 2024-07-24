import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:flutter_compose_ui_modifiers/other/m_reverse.dart';
import 'package:get/get.dart';

class MWhiteSelectTile extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final TextEditingController controller;
  final String? arrowImg;

  const MWhiteSelectTile(
      {required this.label,
      required this.onTap,
      required this.controller,
      this.arrowImg,
      super.key});

  @override
  Widget build(BuildContext context) {
    return MRow(
      modifier:
          MRowModifier.borderBottom(color: Colors.white.withOpacity(0.29)),
      children: [
        MText(
          modifier: MTextModifier.style(MConfig.userInfoTitleStyle2),
          data: label,
        ),
        MTextField(
          modifier: MTextFieldModifier.expanded()
              .hintText('Please select')
              .enable(false)
              .hintStyle(MConfig.textFieldHintStyle)
              .style(MConfig.textFieldStyle)
              .textAlign(
                  MLanUtil.arabicLan ? TextAlign.left : TextAlign.right)
              .contentPadding(EdgeInsets.zero)
              .onTap(onTap),
          controller: controller,
        ),
        10.px.space,
        MReverseWidget(
          child: GetUtils.isNullOrBlank(arrowImg)!
              ? Icon(CupertinoIcons.right_chevron,
                  size: 18.px, color: Colors.white)
              : MImage(modifier: MImageModifier.width(8.px), data: arrowImg!),
        ),
      ],
    );
  }
}
