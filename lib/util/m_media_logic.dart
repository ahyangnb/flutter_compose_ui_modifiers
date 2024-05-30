import 'package:flutter/widgets.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:flutter_compose_ui_modifiers/util/log.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:keyboard_height_plugin/keyboard_height_plugin.dart';

class MMediaLogic extends GetxController with WidgetsBindingObserver {
  final VoidCallback? onKeyboardZero;

  MMediaLogic({this.onKeyboardZero});

  static MMediaLogic get to => Get.find<MMediaLogic>();
  RxDouble maxKeyboardHeight = 0.0.obs;
  static const double minKeyboardHeightDef = 300.0;
  RxDouble maxBottomPaddingHeight = 0.0.obs;

  /// Avoid some error.
  final double maxBottomPaddingHeightValueDef = 100.px;
  final box = GetStorage();

  final String _maxKeyboardHeightKey = "MMediaLogic_maxKeyboardHeightKey";

  // To avoid purple up and pop down animation when the keyboard switch.
  final String _maxBottomPaddingHeightKey =
      "MMediaLogic_maxBottomPaddingHeightKey";

  final KeyboardHeightPlugin _keyboardHeightPlugin = KeyboardHeightPlugin();

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);

    _keyboardHeightPlugin.onKeyboardHeightChanged((double height) {
      /// Get keyboard height.
      updateKeyboardHeight(height);
      if (height == 0 && onKeyboardZero != null) {
        onKeyboardZero!();
      }
    });

    maxKeyboardHeight.value =
        box.read(_maxKeyboardHeightKey) ?? minKeyboardHeightDef;
    maxBottomPaddingHeight.value = box.read(_maxBottomPaddingHeightKey) ?? 0.0;
    if (maxBottomPaddingHeight.value > maxBottomPaddingHeightValueDef) {
      maxBottomPaddingHeight.value =
          Get.context == null ? 0 : MediaQuery.of(Get.context!).padding.bottom;
      box.write(_maxBottomPaddingHeightKey, maxBottomPaddingHeight.value);
    }
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  void updateKeyboardHeight(double newValue) {
    if (newValue > 700) {
      mLogger.e(
          "[updateKeyboardHeight] The newValue is im-normal, newValue:$newValue");
      return;
    }
    if (newValue > 0) {
      maxKeyboardHeight.value = newValue;
      box.write(_maxKeyboardHeightKey, maxKeyboardHeight.value);
    }
  }

  void updateBottomPaddingHeight(double newValue) {
    if (newValue > maxBottomPaddingHeight.value &&
        newValue < maxBottomPaddingHeightValueDef) {
      maxBottomPaddingHeight.value = newValue;
      box.write(_maxBottomPaddingHeightKey, maxBottomPaddingHeight.value);
    }
  }

  @override
  void didChangeMetrics() {
    updateBottomPaddingHeight(MediaQuery.of(Get.context!).padding.bottom);
  }
}
