import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:flutter_compose_ui_modifiers/other/m_nodata.dart';
import 'package:flutter_compose_ui_modifiers/util/log.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

Future<MIndicatorResult> mGetPageData<T>({
  required Future<List<T>?> reqData,
  required MPageState<T> mPageState,
}) async {
  MIndicatorResult result = MIndicatorResult.success;

  try {
    final value = await reqData;
    if (value == null) {
      mPageState.error.value = true;
      result = MIndicatorResult.fail;
    } else {
      if (mPageState.goPage == 1) {
        mPageState.dataList.value = value;
      } else {
        mPageState.dataList.addAll(value);
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
  int goPage = 1;

  RxList<T> dataList = <T>[].obs;
}

class MRefresh extends StatefulWidget {
  final Color mainColor;
  final MPageState mPageState;
  final RxList<dynamic> dataList;
  final Future<MIndicatorResult> Function() onGetData;
  final Widget child;

  const MRefresh({
    this.mainColor = Colors.white,
    required this.mPageState,
    required this.dataList,
    required this.onGetData,
    required this.child,
    super.key,
  });

  @override
  State<MRefresh> createState() => _MRefreshState();
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

class _MRefreshState extends State<MRefresh> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  Future<MIndicatorResult?> handleRefresh() async {
    MConfig.isChildDataLoading.value = true;
    widget.mPageState.goPage = 1;
    try {
      final MIndicatorResult? value = await widget.onGetData();
      refreshDone();
      return value;
    } catch (e) {
      mLogger.e("_MRefreshState::handleRefresh::${e.toString()}");
      refreshDone();
      return MIndicatorResult.fail;
    }
  }

  void refreshDone() {
    MConfig.isChildDataLoading.value = false;
    _refreshController.refreshCompleted(resetFooterState: true);
  }

  Future<MIndicatorResult?> handleLoadMore() async {
    MConfig.isChildDataLoading.value = true;
    widget.mPageState.goPage += 1;
    try {
      final MIndicatorResult? value = await widget.onGetData();
      MConfig.isChildDataLoading.value = false;
      if (value == MIndicatorResult.noMore) {
        _refreshController.loadNoData();
      } else if (value == MIndicatorResult.fail) {
        _refreshController.loadFailed();
      } else {
        _refreshController.loadComplete();
      }
      return value;
    } catch (e) {
      mLogger.e("_MRefreshState::handleRefresh::${e.toString()}");
      MConfig.isChildDataLoading.value = false;
      _refreshController.loadFailed();
      return MIndicatorResult.fail;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: WaterDropHeader(
        waterDropColor: Colors.grey,
        refresh: MLoadingIcon(),
      ),
      footer: ClassicFooter(
        textStyle: TextStyle(color: widget.mainColor),
        loadingIcon: MLoadingIcon(),
      ),
      onRefresh: () => handleRefresh(),
      onLoading: () => handleLoadMore(),
      controller: _refreshController,
      child: Obx(() {
        if (widget.mPageState.isLoading.value) {
          return Container();
        } else if (widget.mPageState.error.value && widget.dataList.isEmpty) {
          return MErrorData(() => widget.onGetData());
        } else {
          if (widget.dataList.isEmpty) {
            return MNoData(() => widget.onGetData());
          }
          return widget.child;
        }
      }),
    );
  }
}

class MLoadingIcon extends StatelessWidget {
  final double? size;

  const MLoadingIcon({this.size, super.key});

  @override
  Widget build(BuildContext context) {
    final sizeUse = size ?? 25.px;
    return SizedBox(
      width: sizeUse,
      height: sizeUse,
      child: CircularProgressIndicator(
        strokeWidth: 3.px,
      ),
    );
  }
}
