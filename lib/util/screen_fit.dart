import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:get/get.dart';

// This extension adds a getter method 'px' to the 'double' type.
// The 'px' getter uses the 'setWidth' method from 'ScreenUtil' to scale the width according to the screen size.
// This allows for convenient usage of 'setWidth' like this: 200.5.px
extension ScreenExtensionDouble on num {
  // The 'px' getter uses the 'setWidth' method from 'ScreenUtil' to scale the width according to the screen size.
  // All of the size value should be use it.
  double get px =>
      Get.context != null ? ((Get.width / 375) * this) : this.toDouble();

  /// For adapted now
  double get pt => px;

  Widget get pxs => px.space;

  Widget get pxS => px.space;

  Widget get pxSpace => px.space;

  Widget get pxWidth => px.spaceWidth;

  Widget get pxHeight => px.spaceHeight;

  Widget get pxW => px.spaceW;

  Widget get pxH => px.spaceH;
}
