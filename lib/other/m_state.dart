import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';

/// custom a mixin who implement the `AutomaticKeepAliveClientMixin` and set the if keep as true, by the way, the build method will be Call super down build.
class MKeepAliveState<T extends StatefulWidget> extends State<T>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
}

class MKeepAliveModifierState<T extends StatefulWidget> extends ModifierState<T>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
}
