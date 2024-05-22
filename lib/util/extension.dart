import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin class WorkManager {
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
}
