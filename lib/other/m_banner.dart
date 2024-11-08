import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';

import '../m/m_image.dart';

class MBanner extends StatelessWidget {
  const MBanner(this.data,
      {this.width, this.height, this.borderRadius, this.onTap, super.key});

  final List<String> data;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final SwiperOnTap? onTap;

  Widget imgBuilder(String img, int index) {
    return MImage(
      modifier: MImageModifier.widthImage(width).heightImage(height).click(() {
        if (onTap == null) {
          mPictureSampleShowBig(img);
        } else {
          onTap!(index);
        }
      }),
      data: img,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return Container();
    }
    if (data.length == 1) {
      return imgBuilder(data.first, 0);
    }
    Widget child = SizedBox(
      width: width,
      height: height,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return imgBuilder(data[index], index);
        },
        itemCount: data.length,
        pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(size: 7.px, activeSize: 7.px)
            // builder: RectSwiperPaginationBuilder(
            //   size: Size(8.px, 4.px),
            //   activeSize: Size(8.px, 4.px),
            //   activeColor: MThemeConfig.mainColor,
            //   color: Color(0xffFFFFFF).withOpacity(0.6),
            // ),
            ),
      ),
    );
    child = ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(4.px),
      child: child,
    );
    return child;
  }
}
