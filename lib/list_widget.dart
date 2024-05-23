import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';

extension ListToWidget on List<Widget> {
  MStack listToStack({AlignmentGeometry? alignment}) {
    return MStack(
      modifier: MStackModifier.alignment(alignment ?? Stack().alignment),
      children: this,
    );
  }

  MRow listToRow({
    final MainAxisAlignment? mainAxisAlignment,
    final CrossAxisAlignment? crossAxisAlignment,
  }) {
    return MRow(
      modifier: MRowModifier.mainAxisAlignment(mainAxisAlignment ??
              Flex(direction: Axis.horizontal).mainAxisAlignment)
          .crossAxisAlignment(crossAxisAlignment ??
              Flex(direction: Axis.horizontal).crossAxisAlignment),
      children: this,
    );
  }
}
