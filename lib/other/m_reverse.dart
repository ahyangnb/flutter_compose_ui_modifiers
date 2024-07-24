import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// for ARABIC language.
class MReverseWidget extends StatelessWidget {
  const MReverseWidget({required this.child, this.reverse, super.key});

  final Widget child;
  final bool? reverse;

  @override
  Widget build(BuildContext context) {
    final bool reverseUse = reverse ?? true;
    // Please make sure you have to set `Get.locale`.
    if (Get.locale?.languageCode == 'ar' && reverseUse) {
      /// If the `LanUtil.ifArabicLan` is ture reverse the image.
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(math.pi),
        child: child,
      );
    } else {
      return child;
    }
  }
}
