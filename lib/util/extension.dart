import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';

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

/// Use case:
///
// @JsonSerializable()
// class ExampleModel {
//   ExampleModel({this.isSwitch, this.rxValue});
//
//   factory ExampleModel.defaultConstructor() => ExampleModel();
//
//   factory ExampleModel.fromJson(Map<String, dynamic> json) =>
//       _$ExampleModelFromJson(json);
//   final bool? isSwitch;
//
//   @MRxIntConverter()
//   final RxInt? rxValue;
//
//   Map<String, dynamic> toJson() => _$ExampleModelToJson(this);
// }
class MRxIntConverter implements JsonConverter<RxInt, int> {
  const MRxIntConverter();

  @override
  RxInt fromJson(int json) => RxInt(json);

  @override
  int toJson(RxInt object) => object.value;
}

class MRxStringConverter implements JsonConverter<RxString, String> {
  const MRxStringConverter();

  @override
  RxString fromJson(String json) => RxString(json);

  @override
  String toJson(RxString object) => object.value;
}

typedef TabControllerWidgetBuilder = Widget Function(
    BuildContext context, TabController tabController);

class MTabControllerListener extends StatefulWidget {
  final TabController tabController;
  final TabControllerWidgetBuilder builder;

  const MTabControllerListener({
    Key? key,
    required this.tabController,
    required this.builder,
  }) : super(key: key);

  @override
  _MTabControllerListenerState createState() => _MTabControllerListenerState();
}

class _MTabControllerListenerState extends State<MTabControllerListener>
    with MCheckTabBarChange {
  @override
  Widget build(BuildContext context) {
    return widget.builder(context, widget.tabController);
  }

  @override
  void onChange(int newIndex) {
    if (mounted) {
      setState(() {
        // Force rebuild when tab changes
      });
    }
  }

  @override
  TabController get tabControllerUse => widget.tabController;
}

mixin MCheckTabBarChange<T extends StatefulWidget> on State<T> {
  TabController get tabControllerUse;

  late int currentTabIndex = tabControllerUse.index;

  void onChange(int newIndex);

  @override
  void initState() {
    super.initState();
    _onTabChanged();
    tabControllerUse.addListener(_onTabChanged);
  }

  @override
  void dispose() {
    tabControllerUse.removeListener(_onTabChanged);
    super.dispose();
  }

  void _onTabChanged() {
    if (currentTabIndex == tabControllerUse.index) {
      return;
    }
    currentTabIndex = tabControllerUse.index;
    onChange(currentTabIndex);
  }
}

extension LocaleExtentsion on Locale? {
  String get localeToStr {
    final String? countryCode = this?.countryCode;
    return '${this?.languageCode}${GetUtils.isNullOrBlank(countryCode)! ? '' : '_$countryCode'}';
  }
}

/// Make a extension to allow list to multiply Contents.
/// He is law, we just use multiply market to Do something in like this
/// ```
/// [
//                     MRow(
//                       children: <Widget>[
//                         MContainer(
//                           modifier: MContainerModifier.width(375.px / 2)
//                               .color(Colors.red)
//                               .height(300.px),
//                         )
//                       ],
//                     ),
//                     MRow(
//                       modifier: MRowModifier.mainAxisEnd(),
//                       children: <Widget>[
//                         MContainer(
//                           modifier: MContainerModifier.width(375.px / 2)
//                               .color(Colors.red)
//                               .height(300.px),
//                         )
//                       ],
//                     ),
//                   ] * 3
/// ```
/// But keep the generic
extension ListMultiply<T> on List<T> {
  List<T> operator *(int times) {
    final List<T> result = <T>[];
    for (var i = 0; i < times; i++) {
      result.addAll(this);
    }
    return result;
  }
}
