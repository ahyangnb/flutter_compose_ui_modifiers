import 'package:easy_refresh/easy_refresh.dart' as easy;
import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:flutter_compose_ui_modifiers/other/m_nodata.dart';
import 'package:flutter_compose_ui_modifiers/util/log.dart';
import 'package:get/get.dart';

Future<easy.IndicatorResult> mEasyGetPageData<T>({
  required Future<List<T>?> reqData,
  required MPageState<T> mPageState,
}) async {
  easy.IndicatorResult result = easy.IndicatorResult.success;

  try {
    final value = await reqData;
    if (value == null) {
      mPageState.error.value = true;
      result = easy.IndicatorResult.fail;
    } else {
      if (mPageState.goPage == 1) {
        mPageState.dataList.value = value;
      } else {
        mPageState.dataList.addAll(value);
      }
      if (mPageState.goPage > 1) {
        // Check if there is no more data
        if (value.length < MConfig.pageLimit) {
          result = easy.IndicatorResult.noMore;
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

class MEasyRefresh extends StatelessWidget {
  final Color? mainColor;
  final MPageState mPageState;
  final RxList<dynamic> dataList;
  final Future<easy.IndicatorResult> Function() onGetData;
  final Widget child;
  final bool justReturnChild;
  final ScrollController? scrollController;

  const MEasyRefresh({
    this.mainColor,
    required this.mPageState,
    required this.dataList,
    required this.onGetData,
    required this.child,
    this.scrollController,
    this.justReturnChild = false,
    super.key,
  });

  Future<easy.IndicatorResult?> handleRefresh() async {
    MConfig.isChildDataLoading.value = true;
    mPageState.goPage = 1;
    final easy.IndicatorResult? value = await onGetData();
    MConfig.isChildDataLoading.value = false;
    return value;
  }

  Future<easy.IndicatorResult?> handleLoadMore() async {
    MConfig.isChildDataLoading.value = true;
    mPageState.goPage += 1;
    final easy.IndicatorResult? value = await onGetData();
    mLogger.d("MEasyRefresh::handleLoadMore::value::$value");
    MConfig.isChildDataLoading.value = false;
    return value;
  }

  @override
  Widget build(BuildContext context) {
    final mainColorUse = mainColor ??
        (Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black);
    return easy.EasyRefresh(
      scrollController: scrollController ?? ScrollController(),
      header: easy.OverrideHeader(
        safeArea: false,
        header: easy.ClassicHeader(
          textStyle: TextStyle(color: mainColorUse),
          messageStyle: TextStyle(color: mainColorUse),
          iconTheme: IconThemeData(color: mainColorUse),
        ),
        triggerWhenReach: true,
      ),
      footer: easy.ClassicFooter(
        textStyle: TextStyle(color: mainColorUse),
        messageStyle: TextStyle(color: mainColorUse),
        iconTheme: IconThemeData(color: mainColorUse),
      ),
      onRefresh: () => handleRefresh(),
      onLoad: () => handleLoadMore(),
      child: justReturnChild
          ? child
          : MEasyRefreshNoData(mPageState, onGetData: onGetData, child: child),
    );
  }
}

class MEasyRefreshNoData extends StatelessWidget {
  final MPageState mPageState;
  final Widget? child;
  final Future<easy.IndicatorResult> Function() onGetData;
  final RxList<dynamic>? dataList;

  MEasyRefreshNoData(this.mPageState,
      {this.child, required this.onGetData, this.dataList});

  @override
  Widget build(BuildContext context) {
    final useDataList = this.dataList ?? mPageState.dataList;
    return Obx(() {
      if (mPageState.isLoading.value) {
        return Container();
      } else if (mPageState.error.value && useDataList.isEmpty) {
        return MErrorData(() => onGetData());
      } else {
        if (useDataList.isEmpty) {
          return MNoData(() => onGetData());
        }
        return child ?? Container();
      }
    });
  }
}
