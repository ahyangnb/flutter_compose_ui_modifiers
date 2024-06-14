import 'package:flutter/material.dart';
import 'package:get/get.dart';

// mixin class WorkManager {
mixin WorkManager {
  List<Worker> workList = <Worker>[];

  /// Create a new ever met, who can listen evens, and that will be destroy went to get the extra controller close.
  Worker everAndAutoClose<T>(
      RxInterface<T> listener, WorkerCallback<T> callback) {
    final worker = ever(listener, callback);
    workList.add(worker);
    return worker;
  }

  void closeWorkList() {
    for (var element in workList) {
      element.dispose();
    }
  }
}

/// You must `extends GetxControllerWithWorks` if use it.
mixin MGetxControllerMixin on GetxControllerWithWorks {}

/// Just extends and use.
class MGetxController extends GetxControllerWithWorks {}

class GetxControllerWithWorks extends GetxController with WorkManager {
  @override
  void onClose() {
    super.onClose();
    closeWorkList();
  }
}

class ModifierState<T extends StatefulWidget> extends State<T>
    with WorkManager {
  @override
  void dispose() {
    super.dispose();
    closeWorkList();
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

extension ModifierBoolHandle on bool {
  bool not() => !this;

  bool get reverse => !this;
}

extension ModifierMapHandle on Map {
  T? getValue<T>(String key) {
    return containsKey(key) ? this[key]! as T : null;
  }

  T? get<T>(String key) {
    return containsKey(key) ? this[key]! as T : null;
  }
}

extension ListCheckConditions on List {
  bool bothEqual(value) {
    for (var item in this) {
      if (item != value) return false;
    }
    return true;
  }
}

extension ModifierObjectEmptyCheck on Object? {
  bool mEmpty() {
    return GetUtils.isNullOrBlank(this)!;
  }

  bool mNotEmpty() {
    return GetUtils.isNullOrBlank(this)!.not();
  }
}

extension ModifierStringCheck on String? {
  bool mIntStr() {
    if (mEmpty()) return false;
    return int.tryParse(this!) != null;
  }
}

bool mIntStr(String? value) => value.mIntStr();

extension InsDelay on int {
  Future delayMilliseconds() {
    return Future.delayed(Duration(milliseconds: this));
  }

  Future delaySeconds() {
    return Future.delayed(Duration(seconds: this));
  }
}
