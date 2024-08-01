import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:get/get.dart';

class ModifierObxWidget extends StatefulWidget {
  final Widget child;
  final Rx<dynamic> valueObx;

  const ModifierObxWidget(this.valueObx, {super.key, required this.child});

  @override
  State<ModifierObxWidget> createState() => _ModifierObxWidgetState();
}

class _ModifierObxWidgetState extends ModifierState<ModifierObxWidget> {
  @override
  void initState() {
    super.initState();
    everAndAutoClose(widget.valueObx, (callback) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
