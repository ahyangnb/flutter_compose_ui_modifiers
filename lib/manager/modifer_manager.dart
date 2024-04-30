import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';

class Modifier extends StatelessWidget {
  const Modifier({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

extension FlutterUIModifiersRowForSet on Widget {
  Widget set(List<Widget> children) {
    if (this is Row) {
      return (this as Row).rebase(children: children);
    }
    return this;
  }
}
