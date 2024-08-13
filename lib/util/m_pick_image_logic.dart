import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:flutter_compose_ui_modifiers/util/log.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../config/m_str.dart';

class MPickImageLogic extends GetxController {
  static MPickImageLogic get to => Get.find<MPickImageLogic>();

  /// When click image icon in chat.
  ///
  /// example:
  /// ```
  // if (moreWidgetType == MoreWidgetType.picture) {
  //       selectImage(ImageSource.gallery);
  //     } else if (moreWidgetType == MoreWidgetType.camera) {
  //       selectImage(ImageSource.camera);
  /// ```
  // void selectImage(ImageSource imageSource) {
  //   MPickImageLogic.to.pickImage(imageSource, (String resultPath) {
  //     sendImageMessageHandle(resultPath);
  //   });
  // }
  /// ```
  Future<void> pickImage(ImageSource imageSource,
      void Function(String resultPath) onResult) async {
    final PermissionStatus? status = imageSource == ImageSource.gallery
        ? await _requestPermissionsPhoto()
        : await _requestPermissionsCamera();

    if (status?.isGranted ?? false) {
      try {
        final ImagePicker picker = ImagePicker();
        final XFile? image = await picker.pickImage(source: imageSource);
        if (image != null) {
          // Store the image path in the state
          onResult(image.path);
        } else {
          // User canceled the picker
        }
      } catch (e, s) {
        mLogger.e('pickImage::e::$e', stackTrace: s, error: e);
        unawaited(
            mConfirmDialog('Notice'.tr, MStr.picturePermission, () async {
          await openAppSettings();
        }, tag: MAppDialogKey.confirmPicturePermission));
      }
    } else {
      unawaited(
          mConfirmDialog('Notice'.tr, MStr.picturePermission, () async {
        await openAppSettings();
      }, tag: MAppDialogKey.confirmPicturePermission));
    }
  }

  Future<PermissionStatus?> _requestPermissionsPhoto() async {
    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo =
          await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt <= 32) {
        return Permission.storage.request();
      } else {
        return Permission.photos.request();
      }
    } else if (Platform.isIOS) {
      final PermissionStatus valueOfPhotos = await Permission.photos.request();
      final PermissionStatus valueOfStorage =
          await Permission.storage.request();

      mLogger.d(
        'Permission Handle: \n'
        '_requestPermissionsPhoto::valueOfPhotos::$valueOfPhotos\n'
        '_requestPermissionsPhoto::valueOfStorage::$valueOfStorage\n',
      );
      return (valueOfPhotos == PermissionStatus.granted ||
                  valueOfStorage == PermissionStatus.granted) ||
              (valueOfPhotos == PermissionStatus.limited ||
                  valueOfStorage == PermissionStatus.limited) ||
              (valueOfPhotos == PermissionStatus.provisional ||
                  valueOfStorage == PermissionStatus.provisional)
          ? PermissionStatus.granted
          : PermissionStatus.denied;
    } else {
      throw Exception('Unsupported platform');
    }
  }

  Future<PermissionStatus?> _requestPermissionsCamera() async {
    if (Platform.isAndroid) {
      return Permission.camera.request();
    } else if (Platform.isIOS) {
      final PermissionStatus valueOfCamera = await Permission.camera.request();
      mLogger.d('_requestPermissions::valueOfCamera::$valueOfCamera');

      return (valueOfCamera == PermissionStatus.granted) ||
              (valueOfCamera == PermissionStatus.limited) ||
              (valueOfCamera == PermissionStatus.provisional)
          ? PermissionStatus.granted
          : PermissionStatus.denied;
    } else {
      throw Exception('Unsupported platform');
    }
  }
}
