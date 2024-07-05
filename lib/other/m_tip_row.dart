import 'package:flutter/cupertino.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';

class MTipRow extends StatelessWidget {
  final String image;
  final String tipText;
  final List<String>? highLightText;
  final VoidCallback? onTap;

  MTipRow({
    required this.image,
    required this.tipText,
    this.highLightText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MRow(
      modifier:
          MRowModifier.backgroundColor(Color(0xffBBBBBB).withOpacity(0.23))
              .paddingVertical(11.px),
      children: [
        8.px.space,
        MImage(
          modifier: MImageModifier.sizeAll(22.px),
          data: image,
        ),
        6.px.space,
        MText(
          modifier: MTextModifier.colorHex(0xffFFFFFF)
              .fontSize(12.px)
              .highlightText(highLightText ?? [])
              .highLightColor(Color(0xffFFBB03))
              .fontWeight(FontWeight.w600)
              .expanded(),
          data: tipText,
        ),
        2.px.space,
        if (onTap != null)
          MButtonMini(
            "Turn on",
            onTap: () => onTap!(),
          ),
        8.px.space,
      ],
    );
  }
}
