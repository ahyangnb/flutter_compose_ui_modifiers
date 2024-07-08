import 'package:flutter_compose_ui_modifiers/util/log.dart';

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
Future<T?> mApiRetry<T>(Future<T> Function() req) async {
  const int maxRetries = 3;
  const Duration retryDelay = Duration(milliseconds: 600);
  int retryCount = 0;

  while (retryCount < maxRetries) {
    mLogger.d("Start get mApiRetry()::${T.toString()}::Start🚗.");
    try {
      final value = await req();
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
