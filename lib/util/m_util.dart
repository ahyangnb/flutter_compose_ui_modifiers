import 'package:flutter/services.dart';
import 'package:flutter_compose_ui_modifiers/util/log.dart';
import 'package:flutter_compose_ui_modifiers/util/toast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MUtil {
  static int smartToInt(value) {
    if (value == null) {
      return 0;
    } else if (value is String) {
      return int.parse(value);
    } else if (value is double) {
      return value.toInt();
    } else if (value is int) {
      return value;
    } else {
      return 0;
    }
  }

  static String full2Num(int value) {
    final valueStr = value.toString();
    if (valueStr.length >= 2) {
      return valueStr;
    } else {
      return '0$valueStr';
    }
  }
}

/// Test code:
///
// void main() async {
//   test("Test the tryAgain function", () async {
//     final int? videoCallResult = await mApiRetry<int>(getIntFuture);
//     if (videoCallResult == null) {
//       return;
//     }
//     print("videoCallResult::$videoCallResult");
//   });
// }
//
// Future<int> getIntFuture() async {
//   print("To getIntFuture get value start");
//   await Future.delayed(Duration(seconds: 1));
//   final nextInt = math.Random().nextInt(100);
//   if (nextInt.isEven) {
//     throw Exception("Error::1");
//   }
//   final millisecond = DateTime.now().millisecond;
//   return millisecond;
// }
///
Future<T?> mApiRetry<T>(Future<T> Function(bool last) req) async {
  const int maxRetries = 3;
  const Duration retryDelay = Duration(milliseconds: 600);
  int retryCount = 0;

  while (retryCount < maxRetries) {
    mLogger.d("Start get mApiRetry()::${T.toString()}::Start🚗.");
    try {
      final value = await req(retryCount >= maxRetries);
      if (value != null) {
        mLogger.d("Start get mApiRetry()::${T.toString()}::Done✅.");
        return value;
      }
      // break;
    } catch (e, s) {
      mLogger.e('mApiRetry::${T.toString()}::Error::$e\n',
          stackTrace: s, error: e);
      retryCount++;
      if (retryCount >= maxRetries) {
        mLogger.e('Max retries reached. Handling error after final attempt.');
        // Handle error after final attempt here
        // break;
        return null;
      } else {
        await Future.delayed(retryDelay);
      }
    }
  }
  return null;
}

extension MCopyUtilExtension on Object {
  Future<void> copy() {
    /// Copy the value to the clipboard.
    return Clipboard.setData(ClipboardData(text: this.toString()));
  }
}

class MButtonController extends GetxController {
  static MButtonController get to => Get.find<MButtonController>();
  final RxBool _isProcessing = false.obs;

  bool get isProcessing => _isProcessing.value;

  set isProcessing(bool value) => _isProcessing.value = value;

  /// Any event who needs to request api or delay must use it.
  Future<void> run(final Future<void> Function() onPressed,
      {String? event, bool showToast = true}) async {
    mLogger.d('[ButtonController] [$event] Start call run().');

    // Check if any button is currently being processed
    if (!MButtonController.to.isProcessing) {
      mLogger.d('[ButtonController] [$event] The event is free.');
      MButtonController.to.isProcessing = true;

      /// The event start.
      try {
        await onPressed();
      }
      // We must use the fan else will be not execute set is a isProcessing to false when error.
      finally {
        /// The event done.
        MButtonController.to.isProcessing = false;
      }
    } else {
      mLogger.d('[ButtonController] The event $event inProcess.');

      /// Some event is isProcessing.
      if (showToast) {
        mShowCustomToast("in process.".tr);
      }
    }
  }
}
