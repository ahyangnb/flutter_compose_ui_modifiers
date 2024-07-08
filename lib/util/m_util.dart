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

Future<T?> mApiRetry<T>(Future<T> req) async {
  const int maxRetries = 3;
  const Duration retryDelay = Duration(milliseconds: 600);
  int retryCount = 0;

  while (retryCount < maxRetries) {
    mLogger.d("Start get mApiRetry()::${T.toString()}::Start🚗.");
    try {
      final value = await req;
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
