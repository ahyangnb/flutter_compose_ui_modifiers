import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// for ARABIC language.
/// When set language please refer to:
/// example
/// ```dart
// static Locale get currentLocale {
//   logger.d(
//     '[currentLocale] Get.locale::${Get.locale}, '
//         'window.locale::${window.locale}, '
//         'Platform.localeName::${Platform.localeName}',
//   );
//   final String? languageSave =
//   GetStorage().read<String>(SpKey.languageSaveKey);
//   Locale getLocale;
//   if (languageSave == null) {
//     if (window.locale.languageCode == 'zh') {
//       /// Only use traditional mandarin.
//       getLocale = LanguageEnumType.CHINESE.locale;
//     } else if (window.locale.languageCode == 'ars') {
//       /// Najdi Arabic[ars as language code.]
//       getLocale = LanguageEnumType.ARABIC.locale;
//     } else {
//       getLocale = window.locale;
//     }
//   } else {
//     getLocale = Locale(languageSave);
//   }
//   Get.locale = getLocale;
//   return getLocale;
// }
/// ```
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
