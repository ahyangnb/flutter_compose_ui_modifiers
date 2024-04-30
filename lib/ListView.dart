import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

extension FlutterUIModifiersListView on ListView {
  ListView paddingZero() {
    return _rebase(padding: EdgeInsets.zero);
  }

  ListView _rebase({
    Axis? scrollDirection,
    bool? reverse,
    ScrollController? controller,
    bool? primary,
    ScrollPhysics? physics,
    bool? shrinkWrap,
    EdgeInsetsGeometry? padding,
    double? cacheExtent,
    int? semanticChildCount,
    DragStartBehavior? dragStartBehavior,
    ScrollViewKeyboardDismissBehavior? keyboardDismissBehavior,
    String? restorationId,
    Clip? clipBehavior,
    List<Widget>? children,
  }) {
    return ListView(
      scrollDirection: scrollDirection ?? this.scrollDirection,
      reverse: reverse ?? this.reverse,
      controller: controller ?? this.controller,
      primary: primary ?? this.primary,
      physics: physics ?? this.physics,
      shrinkWrap: shrinkWrap ?? this.shrinkWrap,
      padding: padding ?? this.padding,
      cacheExtent: cacheExtent ?? this.cacheExtent,
      semanticChildCount: semanticChildCount ?? this.semanticChildCount,
      dragStartBehavior: dragStartBehavior ?? this.dragStartBehavior,
      keyboardDismissBehavior:
          keyboardDismissBehavior ?? this.keyboardDismissBehavior,
      restorationId: restorationId ?? this.restorationId,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      children: children ??
          (this.childrenDelegate is SliverChildListDelegate
              ? (this.childrenDelegate as SliverChildListDelegate).children
              : (this.childrenDelegate as SliverChildListDelegate).children),
    );
  }

  /// A modifier that sets its Text's style.
  ///
  /// ## Example:
  ///
  /// ```dart
  /// ListView(children: items)
  ///     .hideThumb();
  /// ```
  Widget hideThumb(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: this,
    );
  }
}
