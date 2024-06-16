import 'package:get/get.dart';

class MStr {
  static bool get en {
    return Get.locale?.languageCode == "en";
  }

  static String get picturePermission => en
      ? "Please allow file storage permissions and album viewing permissions."
      : "请允许文件存储权限和相册查看权限";

  static String get notice => en ? "Notice" : "通知";

  static String get openCamera => en ? "'Open Camera'" : "打开摄像头";

  static String get selectFromGallery => en ? "Select from Gallery" : "从相册选择";
}
