import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:flutter_compose_ui_modifiers/util/log.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MLanUtil {
  static const String languageSaveKey = 'languageSaveKey';

  static String defLanDisplayName = 'English';

  static bool get arabicLan {
    return (Get.locale ?? currentLocale).languageCode ==
        LanguageEnumType.ARABIC.languageCode;
  }

  static Future<void> setNewLan(String languageCode) async {
    final Locale locale = Locale(languageCode);
    await Get.updateLocale(locale);
    await GetStorage().write(languageSaveKey, languageCode);
  }

  static Locale get currentLocale {
    mLogger.d(
      '[currentLocale] Get.locale::${Get.locale}, '
      'window.locale::${window.locale}, '
      'Platform.localeName::${Platform.localeName}',
    );
    final String? languageSave = GetStorage().read<String>(languageSaveKey);
    Locale getLocale;
    if (languageSave == null) {
      if (window.locale.languageCode == 'zh') {
        /// Only use traditional mandarin.
        getLocale = LanguageEnumType.CHINESE.locale;
      } else if (window.locale.languageCode == 'ars') {
        /// Najdi Arabic[ars as language code.]
        getLocale = LanguageEnumType.ARABIC.locale;
      } else {
        getLocale = window.locale;
      }
    } else {
      getLocale = Locale(languageSave);
    }
    Get.locale ??= getLocale;
    return getLocale;
  }
}

enum LanguageEnumType {
  ENGLISH,
  ARABIC,
  SPANISH,
  TURKISH,
  KOREAN,
  GERMAN,
  JAPANESE,
  ITALIAN,
  HINDI,
  CHINESE,
  THAI,
  FRENCH;

  String get displayName {
    switch (this) {
      case LanguageEnumType.ENGLISH:
        return 'English';
      case LanguageEnumType.ARABIC:
        return 'بالعربي';
      case LanguageEnumType.SPANISH:
        return 'Español';
      case LanguageEnumType.TURKISH:
        return 'Türkçe';
      case LanguageEnumType.KOREAN:
        return '한국어';
      case LanguageEnumType.GERMAN:
        return 'Deutsch';
      case LanguageEnumType.JAPANESE:
        return '日本語';
      case LanguageEnumType.ITALIAN:
        return 'Italiano';
      case LanguageEnumType.HINDI:
        return 'हिन्दी';
      case LanguageEnumType.CHINESE:
        return '中文（繁體）';
      case LanguageEnumType.THAI:
        return 'ภาษาไทย';
      case LanguageEnumType.FRENCH:
        return 'Français';
    }
  }

  String get languageCode {
    return _lanCode;
  }

  String get _lanCode {
    switch (this) {
      case LanguageEnumType.ENGLISH:
        return 'en';
      case LanguageEnumType.ARABIC:
        return 'ar';
      case LanguageEnumType.SPANISH:
        return 'es';
      case LanguageEnumType.TURKISH:
        return 'tr';
      case LanguageEnumType.KOREAN:
        return 'ko';
      case LanguageEnumType.GERMAN:
        return 'de';
      case LanguageEnumType.JAPANESE:
        return 'ja';
      case LanguageEnumType.ITALIAN:
        return 'it';
      case LanguageEnumType.HINDI:
        return 'hi';
      case LanguageEnumType.CHINESE:
        return 'zh';
      case LanguageEnumType.THAI:
        return 'th';
      case LanguageEnumType.FRENCH:
        return 'fr';
    }
  }

  String? get _countryCode {
    if (this == LanguageEnumType.CHINESE) {
      return 'TW';
    } else {
      return null;
    }
  }

  String get lanWithCountryCode {
    return _lanCode + (_countryCode == null ? '' : '_$_countryCode');
  }

  Locale get locale {
    return Locale(_lanCode, _countryCode == null ? '' : '_$_countryCode');
  }
}

extension LanguageEnumTypeExtension on LanguageEnumType {
  static List<LanguageEnumType> get values => [
        LanguageEnumType.ENGLISH,
        LanguageEnumType.ARABIC,
        LanguageEnumType.SPANISH,
        LanguageEnumType.TURKISH,
        LanguageEnumType.KOREAN,
        LanguageEnumType.GERMAN,
        LanguageEnumType.JAPANESE,
        LanguageEnumType.ITALIAN,
        LanguageEnumType.HINDI,
        LanguageEnumType.CHINESE,
        LanguageEnumType.THAI,
        LanguageEnumType.FRENCH,
      ];
}

extension LanToDisplayName on String? {
  String? get getDisplayName {
    if (GetUtils.isNullOrBlank(this)!) {
      return MLanUtil.defLanDisplayName;
    }
    return LanguageEnumTypeExtension.values
            .firstWhereOrNull((LanguageEnumType element) =>
                element.lanWithCountryCode == this ||
                element.languageCode == this)
            ?.displayName ??
        MLanUtil.defLanDisplayName;
  }
}
