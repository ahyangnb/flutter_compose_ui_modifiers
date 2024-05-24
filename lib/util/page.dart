import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:flutter_compose_ui_modifiers/other/m_nodata.dart';
import 'package:flutter_compose_ui_modifiers/util/log.dart';
import 'package:get/get.dart';

Future<IndicatorResult> mGetPageData<T>({
  required Future<List<T>?> reqData,
  required MPageState<T> mPageState,
}) async {
  IndicatorResult result = IndicatorResult.success;

  try {
    final value = await reqData;
    if (value == null) {
      mPageState.error.value = true;
      result = IndicatorResult.fail;
    } else {
      if (mPageState.goPage == 1) {
        mPageState.dataList.value = value;
      } else {
        mPageState.dataList.addAll(value);
      }
      if (mPageState.goPage > 1) {
        // Check if there is no more data
        if (value.length < MConfig.pageLimit) {
          result = IndicatorResult.noMore;
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
  int goPage = 1;

  RxList<T> dataList = <T>[].obs;
}

class MRefresh extends StatelessWidget {
  final Color mainColor;
  final MPageState mPageState;
  final RxList<dynamic> dataList;
  final Future<IndicatorResult> Function() onGetData;
  final Widget child;

  const MRefresh({
    this.mainColor = Colors.white,
    required this.mPageState,
    required this.dataList,
    required this.onGetData,
    required this.child,
    super.key,
  });

  Future<IndicatorResult?> handleRefresh() async {
    MConfig.isChildDataLoading.value = true;
    mPageState.goPage = 1;
    final IndicatorResult? value = await onGetData();
    MConfig.isChildDataLoading.value = false;
    return value;
  }

  Future<IndicatorResult?> handleLoadMore() async {
    MConfig.isChildDataLoading.value = true;
    mPageState.goPage += 1;
    final IndicatorResult? value = await onGetData();
    MConfig.isChildDataLoading.value = false;
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      header: OverrideHeader(
        header: ClassicHeader(
          textStyle: TextStyle(color: mainColor),
          messageStyle: TextStyle(color: mainColor),
          iconTheme: IconThemeData(color: mainColor),
        ),
        triggerWhenReach: true,
      ),
      footer: ClassicFooter(
        textStyle: TextStyle(color: mainColor),
        messageStyle: TextStyle(color: mainColor),
        iconTheme: IconThemeData(color: mainColor),
      ),
      onRefresh: () => handleRefresh(),
      onLoad: () => handleLoadMore(),
      child: Obx(() {
        if (mPageState.isLoading.value) {
          return Container();
        } else if (mPageState.error.value && dataList.isEmpty) {
          return MErrorData(() => onGetData());
        } else {
          if (dataList.isEmpty) {
            return MNoData(() => onGetData());
          }
          return child;
        }
      }),
    );
  }
}
