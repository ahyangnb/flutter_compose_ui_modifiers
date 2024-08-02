import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';

class MTabIndicatorSolid extends Decoration {
  final Color? color;
  final double? width;
  final double? height;

  MTabIndicatorSolid({this.color, this.width, this.height});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _MTabIndicatorSolidPainter(this, onChanged);
  }
}

class _MTabIndicatorSolidPainter extends BoxPainter {
  final MTabIndicatorSolid decoration;

  _MTabIndicatorSolidPainter(this.decoration, VoidCallback? onChanged)
      : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint()
      ..color = decoration.color ?? const Color(0xff8445DC)
      ..style = PaintingStyle.fill;

    /// Define a width variable that uses the default for 30 PX if the income width is null.
    final double width = decoration.width ?? 30.px;
    final double height = decoration.height ?? 4.px;

    final Rect rect =
        Offset(offset.dx + width, configuration.size!.height - height) &
            Size(width, height);
    canvas.drawRect(rect, paint);
  }
}
