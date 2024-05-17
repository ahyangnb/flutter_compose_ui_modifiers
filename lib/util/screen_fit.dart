import 'package:get/get.dart';

// This extension adds a getter method 'px' to the 'double' type.
// The 'px' getter uses the 'setWidth' method from 'ScreenUtil' to scale the width according to the screen size.
// This allows for convenient usage of 'setWidth' like this: 200.5.px
extension ScreenExtensionDouble on num {
  // The 'px' getter uses the 'setWidth' method from 'ScreenUtil' to scale the width according to the screen size.
  // All of the size value should be use it.
  double get px =>
      Get.context != null ? ((Get.width / 375) * this) : this.toDouble();
}
