import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:flutter_compose_ui_modifiers/other/m_nodata.dart';
import 'package:flutter_compose_ui_modifiers/util/log.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
}

class MRefreshController {
  _MRefreshState? _refreshState;

  void setRefreshState(_MRefreshState state) {
    _refreshState = state;
  }

  Future<MIndicatorResult?> refreshContent() async {
    return _refreshState?.handleRefresh();
  }
}

class MRefresh extends StatefulWidget {
  final Color mainColor;
  final MPageState mPageState;
  final RxList<dynamic> dataList;
  final Future<MIndicatorResult> Function() onGetData;
  final Widget child;
  final RefreshController? refreshController;
  final ScrollController? scrollController;
  final MRefreshController? mRefreshController;

  const MRefresh({
    this.mainColor = Colors.white,
    required this.mPageState,
    required this.dataList,
    required this.onGetData,
    required this.child,
    this.refreshController,
    this.scrollController,
    this.mRefreshController,
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
  late RefreshController _refreshController =
      widget.refreshController ?? RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    widget.mRefreshController?.setRefreshState(this);
  }

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
      scrollController: widget.scrollController,
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
