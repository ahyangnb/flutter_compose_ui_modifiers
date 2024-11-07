import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:flutter_compose_ui_modifiers/util/log.dart';
import 'package:get/get.dart';

Future<MIndicatorResult> mGetPageData<T>({
  required Future<List<T>?> reqData,
  required MPageState<T> mPageState,
  List<T>? Function(List<T> value)? handleData,
}) async {
  MIndicatorResult result = MIndicatorResult.success;

  try {
    List<T>? value = await reqData;
    if (value == null) {
      mPageState.error.value = true;
      result = MIndicatorResult.fail;
    } else {
      if (handleData != null) {
        value = handleData(value);
      }
      if (mPageState.goPage == 1) {
        mPageState.dataList.value = value!;
      } else {
        mPageState.dataList.addAll(value!);
      }
      if (mPageState.goPage > 1) {
        // Check if there is no more data
        if (value.length < MConfig.pageLimit) {
          result = MIndicatorResult.noMore;
        }
      }
      mPageState.error.value = false;
    }
  } catch (e, s) {
    mLogger.e('message::$e, stack::${s.toString()}');
    mPageState.error.value = true;
  } finally {
    mPageState.isLoading.value = false;
  }
  return result;
}

mixin class MPageState<T> {
  RxBool error = false.obs;
  RxBool isLoading = true.obs;

  static final int goPageDef = 1;
  int goPage = goPageDef;

  RxList<T> dataList = <T>[].obs;

  void resetGoPage() {
    goPage = goPageDef;
  }

  Future<IndicatorResult> singleLoadLogic(FutureCallback handle) async {
    try {
      await handle();
      isLoading.value = false;
      error.value = false;
      return IndicatorResult.success;
    } catch (e) {
      logger.e(e);
      myToast('Data error');
      isLoading.value = false;
      error.value = true;
      return IndicatorResult.fail;
    }
  }
}

/// The status returned after the task is completed.
enum MIndicatorResult {
  /// No state until the task is not triggered.
  none,

  /// Task succeeded.
  success,

  /// Task failed.
  fail,

  /// No more data.
  noMore,
}

class MLoadingIcon extends StatelessWidget {
  final double? size;
  final bool? center;
  final EdgeInsetsGeometry? margin;

  const MLoadingIcon({this.size, this.center, this.margin, super.key});

  @override
  Widget build(BuildContext context) {
    final sizeUse = size ?? 25.px;
    final body = Container(
      margin: margin,
      width: sizeUse,
      height: sizeUse,
      child: CircularProgressIndicator(
        strokeWidth: 3.px,
      ),
    );
    if (center ?? false) {
      return Center(child: body);
    }
    return body;
  }
}
