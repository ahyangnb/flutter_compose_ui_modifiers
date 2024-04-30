import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';

// use demo.
//
// Widget itemBuilder(e) {
//   final index = state.items.indexOf(e);
//   return const Row()
//       .modifier(const Modifier()
//       .paddingAll(16.px)
//       .backgroundColor(Colors.white.withOpacity(0.22))
//       .borderRadiusSet(8.px)
//       .marginSymmetric(horizontal: 16.px)
//       .marginOnly(top: index == 0 ? 35.px : 25.px)
//       .click(() => logic.actions(e[0])))
//       .set([
//     Image.asset(e[1]).setSize(30.px).marginRight(10.px),
//     Text(e[2]).color(Colors.white).fontSize(18.px).heightSize(25.px / 18.px)
//   ]);
// }
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
