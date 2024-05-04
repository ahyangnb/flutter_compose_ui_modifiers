import 'package:flutter/material.dart';

class MListView extends ListView {
  final MListView? modifier;
  final List<Widget>? children;

  MListView({
    required this.modifier,
    this.children,
    final bool? reverse,
    final ScrollPhysics? physics,
    final EdgeInsetsGeometry? padding,
  }) : super(
          children: children ?? modifier?.children ?? [],
          reverse: reverse ?? modifier?.reverse ?? false,
          physics: physics ?? modifier?.physics,
          padding: padding ?? modifier?.padding,
        );
}

final MListViewModifier = MListView(modifier: null, children: null);

extension MListViewModifierPropertys on MListView {
  MListView setPadding(double value) {
    final scaffold = this;
    final newScaffold = MListView(
      modifier: scaffold.modifier,
      children: scaffold.children,
      reverse: scaffold.reverse,
      physics: scaffold.physics,
      padding: EdgeInsets.all(value),
    );
    return newScaffold;
  }

  MListView setReverse(bool value) {
    final scaffold = this;
    final newScaffold = MListView(
      modifier: scaffold.modifier,
      children: scaffold.children,
      reverse: value,
      physics: scaffold.physics,
      padding: scaffold.padding,
    );
    return newScaffold;
  }

  MListView setPhysics(ScrollPhysics physics) {
    final scaffold = this;
    final newScaffold = MListView(
      modifier: scaffold.modifier,
      children: scaffold.children,
      reverse: scaffold.reverse,
      physics: physics,
      padding: scaffold.padding,
    );
    return newScaffold;
  }

// MListView setPadding(double value) {
//   final scaffold = this;
//   final newScaffold = MListView(
//     modifier: scaffold.modifier,
//     children: scaffold.children,
//     reverse: scaffold.reverse,
//     physics: scaffold.physics,
//     padding: EdgeInsets.all(value),
//   );
//   return newScaffold;
// }
}

// class CListView extends ListView {
//   CListView({
//     Key? key,
//     Axis scrollDirection = Axis.vertical,
//     bool reverse = false,
//     ScrollController? controller,
//     bool primary = true,
//     ScrollPhysics? physics,
//     bool shrinkWrap = false,
//     EdgeInsetsGeometry padding = EdgeInsets.zero,
//     double cacheExtent = 0.0,
//     int? semanticChildCount,
//     DragStartBehavior dragStartBehavior = DragStartBehavior.start,
//     ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
//         ScrollViewKeyboardDismissBehavior.manual,
//     String? restorationId,
//     Clip clipBehavior = Clip.hardEdge,
//     required List<Widget> children,
//   }) : super(
//           key: key,
//           scrollDirection: scrollDirection,
//           reverse: reverse,
//           controller: controller,
//           primary: primary,
//           physics: physics,
//           shrinkWrap: shrinkWrap,
//           padding: padding,
//           cacheExtent: cacheExtent,
//           semanticChildCount: semanticChildCount,
//           dragStartBehavior: dragStartBehavior,
//           keyboardDismissBehavior: keyboardDismissBehavior,
//           restorationId: restorationId,
//           clipBehavior: clipBehavior,
//           // childrenDelegate: SliverChildListDelegate(children),
//         );
//
//   CListView.set(List<Widget> children) : super(children: children);
// }
