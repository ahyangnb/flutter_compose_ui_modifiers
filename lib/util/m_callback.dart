import 'package:flutter/foundation.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';

/// String.
typedef StringCallBack = void Function(String value);
typedef StringCallBackFuture<T> = Future<T> Function(String value);
typedef StringCallBackReturn<T> = T Function(String value);

/// Bool
typedef BoolCallBack = void Function(bool value);
typedef BoolCallBackFuture<T> = Future<T> Function(bool value);
typedef BoolCallBackReturn<T> = T Function(bool value);

/// Int.
typedef IntCallBack = void Function(int value);
typedef IntCallBackFuture<T> = Future<T> Function(int value);
typedef IntCallBackReturn<T> = T Function(int value);

/// List.
typedef ListCallBack<T> = void Function(List<T> value);
typedef ListCallBackFuture<T, R> = Future<R> Function(List<T> value);
typedef ListCallBackReturn<T, R> = R Function(List<T> value);

/// General.
/// Function type of return Future value.
typedef FutureCallback<T> = Future<T> Function();

/// Function type of return value.
typedef ReturnCallback<T> = T Function();

/// Function type of return value.
typedef ReturnCallbackWithParam<T, P> = T Function(P);

/// CallBack
typedef CallBack = Function(dynamic value);

/// function type with multiple parameters
typedef BinaryCallback<T, U> = void Function(T a, U b);

// Asynchronous function type with error handling
typedef AsyncCallbackWithError<T> = Future<T> Function(
    void Function(Object error));

// A function that returns bool, based on an int parameter
typedef BoolCallbackWithInt = bool Function(int value);

// A function that takes two int parameters and returns their sum
typedef SumCallback = int Function(int a, int b);

// An asynchronous function that receives an int parameter and returns a Future<String>
typedef StringFutureCallbackWithInt = Future<String> Function(int value);

void debugDo(VoidCallback onAction,
    [bool? condition1, bool? condition2, bool? condition3]) {
  if (condition1 != null && condition1.not()) return;
  if (condition2 != null && condition2.not()) return;
  if (condition3 != null && condition3.not()) return;
  if (kDebugMode) onAction();
}
