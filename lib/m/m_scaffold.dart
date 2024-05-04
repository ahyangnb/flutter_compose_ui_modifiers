import 'package:flutter/material.dart';

class MScaffold extends Scaffold {
  final MScaffold? modifier;
  final Widget? body;

  MScaffold(
      {required this.modifier,
      required this.body,
      final PreferredSizeWidget? appBar,
      final Color? backgroundColor,
      final bool? resizeToAvoidBottomInset,
      super.drawer,
      super.drawerDragStartBehavior,
      super.endDrawer,
      super.floatingActionButton,
      super.floatingActionButtonLocation,
      super.floatingActionButtonAnimator,
      super.persistentFooterButtons,
      super.bottomNavigationBar,
      super.bottomSheet,
      super.primary,
      super.drawerScrimColor,
      super.extendBody,
      super.extendBodyBehindAppBar,
      super.drawerEdgeDragWidth,
      super.drawerEnableOpenDragGesture,
      super.endDrawerEnableOpenDragGesture,
      super.onDrawerChanged,
      super.onEndDrawerChanged,
      super.restorationId})
      : super(
          appBar: appBar ?? modifier?.appBar,
          backgroundColor: backgroundColor ?? modifier?.backgroundColor,
          resizeToAvoidBottomInset:
              resizeToAvoidBottomInset ?? modifier?.resizeToAvoidBottomInset,
        );
}

final MScaffoldModifier = MScaffold(modifier: null, body: null);

extension MScaffoldModifierPropertys on MScaffold {
  MScaffold title(String title) {
    final scaffold = this;
    return MScaffold(
      modifier: scaffold.modifier,
      body: scaffold.body,
      backgroundColor: scaffold.backgroundColor,
      appBar: AppBar(title: Text(title)),
    );
  }

  MScaffold setAppBar(PreferredSizeWidget? appBar) {
    final scaffold = this;
    if (scaffold.appBar != null) {
      throw Exception(
          'AppBar is not null, please remove the title or don\'t be set the appBar twice.');
    }
    return MScaffold(
      modifier: scaffold.modifier,
      body: scaffold.body,
      backgroundColor: scaffold.backgroundColor,
      appBar: appBar,
    );
  }

  MScaffold setDrawer(Widget drawer) {
    final scaffold = this;
    return MScaffold(
      modifier: scaffold.modifier,
      body: scaffold.body,
      backgroundColor: scaffold.backgroundColor,
      appBar: scaffold.appBar,
      drawer: drawer,
      // include other properties as needed
    );
  }

  MScaffold setBackgroundColor(Color backgroundColor) {
    final scaffold = this;
    final newScaffold = MScaffold(
      modifier: scaffold.modifier,
      body: scaffold.body,
      appBar: scaffold.appBar,
      backgroundColor: backgroundColor,
      // include other properties as needed
    );
    print("newScaffold color is ${newScaffold.backgroundColor}");
    return newScaffold;
  }

  MScaffold setResizeToAvoidBottomInset(bool resizeToAvoidBottomInset) {
    final scaffold = this;
    final newScaffold = MScaffold(
      modifier: scaffold.modifier,
      body: scaffold.body,
      appBar: scaffold.appBar,
      backgroundColor: scaffold.backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    );
    print("newScaffold color is ${newScaffold.backgroundColor}");
    return newScaffold;
  }
}
