import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MScaffold extends StatelessWidget {
  final MScaffoldModifierDefine? modifier;
  final Widget? body;

  MScaffold({this.modifier, this.body});

  @override
  Widget build(BuildContext context) {
    final defScaffold = Scaffold();
    Widget scaffold = Scaffold(
      appBar: modifier?.appBarValue,
      backgroundColor: modifier?.backgroundColorValue,
      resizeToAvoidBottomInset: modifier?.resizeToAvoidBottomInsetValue ?? true,
      drawer: modifier?.drawerValue,
      drawerDragStartBehavior: modifier?.drawerDragStartBehaviorValue ??
          defScaffold.drawerDragStartBehavior,
      endDrawer: modifier?.endDrawerValue,
      floatingActionButton: modifier?.floatingActionButtonValue,
      floatingActionButtonLocation: modifier?.floatingActionButtonLocationValue,
      floatingActionButtonAnimator: modifier?.floatingActionButtonAnimatorValue,
      persistentFooterButtons: modifier?.persistentFooterButtonsValue,
      bottomNavigationBar: modifier?.bottomNavigationBarValue,
      bottomSheet: modifier?.bottomSheetValue,
      primary: modifier?.primaryValue ?? defScaffold.primary,
      drawerScrimColor: modifier?.drawerScrimColorValue,
      extendBody: modifier?.extendBodyValue ?? defScaffold.extendBody,
      extendBodyBehindAppBar: modifier?.extendBodyBehindAppBarValue ??
          defScaffold.extendBodyBehindAppBar,
      drawerEdgeDragWidth: modifier?.drawerEdgeDragWidthValue,
      drawerEnableOpenDragGesture: modifier?.drawerEnableOpenDragGestureValue ??
          defScaffold.drawerEnableOpenDragGesture,
      endDrawerEnableOpenDragGesture:
          modifier?.endDrawerEnableOpenDragGestureValue ??
              defScaffold.endDrawerEnableOpenDragGesture,
      onDrawerChanged: modifier?.onDrawerChangedValue,
      onEndDrawerChanged: modifier?.onEndDrawerChangedValue,
      restorationId: modifier?.restorationIdValue,
      body: body,
    );
    if (modifier?.autoHideKeyboardValue ?? false) {
      scaffold = GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: scaffold,
      );
    }
    return scaffold;
  }
}

final MScaffoldModifier = MScaffoldModifierDefine();

class MScaffoldModifierDefine {
  /// feature: Auto scaleless keyboard when click blank area.
  final bool autoHideKeyboardValue;

  /// ===================From flutter===================
  final PreferredSizeWidget? appBarValue;
  final Color? backgroundColorValue;
  final bool? resizeToAvoidBottomInsetValue;
  final Widget? drawerValue;
  final DragStartBehavior? drawerDragStartBehaviorValue;
  final Widget? endDrawerValue;
  final Widget? floatingActionButtonValue;
  final FloatingActionButtonLocation? floatingActionButtonLocationValue;
  final FloatingActionButtonAnimator? floatingActionButtonAnimatorValue;
  final List<Widget>? persistentFooterButtonsValue;
  final Widget? bottomNavigationBarValue;
  final Widget? bottomSheetValue;
  final bool? primaryValue;
  final Color? drawerScrimColorValue;
  final bool? extendBodyValue;
  final bool? extendBodyBehindAppBarValue;
  final double? drawerEdgeDragWidthValue;
  final bool? drawerEnableOpenDragGestureValue;
  final bool? endDrawerEnableOpenDragGestureValue;
  final DrawerCallback? onDrawerChangedValue;
  final DrawerCallback? onEndDrawerChangedValue;
  final String? restorationIdValue;

  MScaffoldModifierDefine({
    this.autoHideKeyboardValue = true,

    /// ===================From flutter===================
    this.appBarValue,
    this.backgroundColorValue,
    this.resizeToAvoidBottomInsetValue,
    this.drawerValue,
    this.drawerDragStartBehaviorValue,
    this.endDrawerValue,
    this.floatingActionButtonValue,
    this.floatingActionButtonLocationValue,
    this.floatingActionButtonAnimatorValue,
    this.persistentFooterButtonsValue,
    this.bottomNavigationBarValue,
    this.bottomSheetValue,
    this.primaryValue,
    this.drawerScrimColorValue,
    this.extendBodyValue,
    this.extendBodyBehindAppBarValue,
    this.drawerEdgeDragWidthValue,
    this.drawerEnableOpenDragGestureValue,
    this.endDrawerEnableOpenDragGestureValue,
    this.onDrawerChangedValue,
    this.onEndDrawerChangedValue,
    this.restorationIdValue,
  });

  /// Create a copyWith().
  MScaffoldModifierDefine copyWith({
    bool? autoHideKeyboardValue,
    PreferredSizeWidget? appBarValue,
    Color? backgroundColorValue,
    bool? resizeToAvoidBottomInsetValue,
    Widget? drawerValue,
    DragStartBehavior? drawerDragStartBehaviorValue,
    Widget? endDrawerValue,
    Widget? floatingActionButtonValue,
    FloatingActionButtonLocation? floatingActionButtonLocationValue,
    FloatingActionButtonAnimator? floatingActionButtonAnimatorValue,
    List<Widget>? persistentFooterButtonsValue,
    Widget? bottomNavigationBarValue,
    Widget? bottomSheetValue,
    bool? primaryValue,
    Color? drawerScrimColorValue,
    bool? extendBodyValue,
    bool? extendBodyBehindAppBarValue,
    double? drawerEdgeDragWidthValue,
    bool? drawerEnableOpenDragGestureValue,
    bool? endDrawerEnableOpenDragGestureValue,
    DrawerCallback? onDrawerChangedValue,
    DrawerCallback? onEndDrawerChangedValue,
    String? restorationIdValue,
  }) {
    return MScaffoldModifierDefine(
      autoHideKeyboardValue:
          autoHideKeyboardValue ?? this.autoHideKeyboardValue,

      /// ===================From flutter===================
      appBarValue: appBarValue ?? this.appBarValue,
      backgroundColorValue: backgroundColorValue ?? this.backgroundColorValue,
      resizeToAvoidBottomInsetValue:
          resizeToAvoidBottomInsetValue ?? this.resizeToAvoidBottomInsetValue,
      drawerValue: drawerValue ?? this.drawerValue,
      drawerDragStartBehaviorValue:
          drawerDragStartBehaviorValue ?? this.drawerDragStartBehaviorValue,
      endDrawerValue: endDrawerValue ?? this.endDrawerValue,
      floatingActionButtonValue:
          floatingActionButtonValue ?? this.floatingActionButtonValue,
      floatingActionButtonLocationValue: floatingActionButtonLocationValue ??
          this.floatingActionButtonLocationValue,
      floatingActionButtonAnimatorValue: floatingActionButtonAnimatorValue ??
          this.floatingActionButtonAnimatorValue,
      persistentFooterButtonsValue:
          persistentFooterButtonsValue ?? this.persistentFooterButtonsValue,
      bottomNavigationBarValue:
          bottomNavigationBarValue ?? this.bottomNavigationBarValue,
      bottomSheetValue: bottomSheetValue ?? this.bottomSheetValue,
      primaryValue: primaryValue ?? this.primaryValue,
      drawerScrimColorValue:
          drawerScrimColorValue ?? this.drawerScrimColorValue,
      extendBodyValue: extendBodyValue ?? this.extendBodyValue,
      extendBodyBehindAppBarValue:
          extendBodyBehindAppBarValue ?? this.extendBodyBehindAppBarValue,
      drawerEdgeDragWidthValue:
          drawerEdgeDragWidthValue ?? this.drawerEdgeDragWidthValue,
      drawerEnableOpenDragGestureValue: drawerEnableOpenDragGestureValue ??
          this.drawerEnableOpenDragGestureValue,
      endDrawerEnableOpenDragGestureValue:
          endDrawerEnableOpenDragGestureValue ??
              this.endDrawerEnableOpenDragGestureValue,
      onDrawerChangedValue: onDrawerChangedValue ?? this.onDrawerChangedValue,
      onEndDrawerChangedValue:
          onEndDrawerChangedValue ?? this.onEndDrawerChangedValue,
      restorationIdValue: restorationIdValue ?? this.restorationIdValue,
    );
  }
}

extension MScaffoldModifierPropertys on MScaffoldModifierDefine {
  MScaffoldModifierDefine autoHideKeyboard(bool value) {
    return this.copyWith(autoHideKeyboardValue: value);
  }

  MScaffoldModifierDefine title(String value) {
    return this.copyWith(appBarValue: AppBar(title: Text(value)));
  }

  /// ================Flutter=========Start
  MScaffoldModifierDefine appBar(PreferredSizeWidget value) {
    return this.copyWith(appBarValue: value);
  }

  MScaffoldModifierDefine drawer(Widget value) {
    return this.copyWith(drawerValue: value);
  }

  MScaffoldModifierDefine backgroundColor(Color value) {
    return this.copyWith(backgroundColorValue: value);
  }

  MScaffoldModifierDefine resizeToAvoidBottomInset(bool value) {
    return this.copyWith(resizeToAvoidBottomInsetValue: value);
  }

  /// ================Flutter=========End
}
