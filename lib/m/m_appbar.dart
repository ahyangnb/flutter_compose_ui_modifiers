import 'package:flutter/material.dart';

class MAppBar extends AppBar {
  final MAppBar? modifier;
  final Widget? title;

  MAppBar({
    required this.modifier,
    this.title,
    final Color? backgroundColor,
    final bool? centerTitle,
  }) : super(
          backgroundColor: backgroundColor ?? modifier?.backgroundColor,
          title: title,
          centerTitle: centerTitle ?? modifier?.centerTitle,
        );
}

final MAppBarModifier = MAppBar(modifier: null, title: null);

extension MAppBarModifierPropertys on MAppBar {
  MAppBar setBackgroundColor(Color backgroundColor) {
    final scaffold = this;
    final newScaffold = MAppBar(
      modifier: scaffold.modifier,
      backgroundColor: backgroundColor,
    );
    return newScaffold;
  }

  MAppBar setCenterTitle(bool centerTitle) {
    final scaffold = this;
    final newScaffold = MAppBar(
      modifier: scaffold.modifier,
      backgroundColor: scaffold.backgroundColor,
      centerTitle: centerTitle,
    );
    return newScaffold;
  }
}
