import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/util/log.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../config/m_str.dart';
import '../other/m_confirm_dialog.dart';
import 'toast.dart';

class MPickerImageUtil {
  ///
  /// Question: why the application ID in the local path is different every time I launch the app use flutter in ios?
  ///
  /// In iOS, the application's directory path includes the application's unique identifier (UUID),
  /// which is generated anew each time the app is installed. This means that if you uninstall and then reinstall the app,
  /// or if you're installing new builds of the app during development, the UUID will change,
  /// and so will the full path to the app's directory.  This is a security feature of iOS.
  /// It prevents one app from knowing the path to another app's directory,
  /// which could potentially be used to access the other app's data.
  /// In your Flutter code, you should never hard-code the full path to the app's directory.
  /// Instead, you should always use the getApplicationDocumentsDirectory or getLibraryDirectory methods
  /// from the path_provider package to get the current path to the app's directory. This ensures that
  /// your code will work correctly even if the app's UUID changes.  Here's an example of
  /// how you can get the app's directory path:
  /// ```dart
  /// import 'package:path_provider/path_provider.dart';
  ///
  /// Future<String> getApplicationDirectoryPath() async {
  ///   final Directory directory = await getApplicationDocumentsDirectory();
  ///   return directory.path;
  /// }
  /// ```
  /// This function will always return the current path to the app's directory, even if the app's UUID changes.
  static Future<String?> saveImage(String imagePath) async {
    try {
      final File imageFile = File(imagePath);

      /// Get the app's directory path
      /// Result is such as `/var/mobile/Containers/Data/Application/2F46BAD9-3C9C-4771-878F-7FE25238106B/Documents/2024-04-07T11:40:52.985441.jpg`.
      // final Directory directory = await getApplicationDocumentsDirectory();

      /// Result is such as `/var/mobile/Containers/Data/Application/2F46BAD9-3C9C-4771-878F-7FE25238106B/Library/2024-04-07T11:42:37.332963.jpg`.
      final Directory directory = await getLibraryDirectory();

      /// Result is such as `/var/mobile/Containers/Data/Application/2640D898-6053-4213-A810-8A6E11DD48C2/Library/Application Support/2024-04-07T11:46:30.440009.jpg`.
      // final Directory directory = await getApplicationSupportDirectory();

      /// PathNotFoundException: Cannot copy file to '/var/mobile/Containers/Data/Application/2640D898-6053-4213-A810-8A6E11DD48C2/Downloads/2024-04-07T11:49:00.931488.jpg',
      /// path = '/private/var/mobile/Containers/Data/Application/2640D898-6053-4213-A810-8A6E11DD48C2/tmp/image_picker_8C545078-F167-43FC-BE00-AB5715957ADE-1498-000002DBA209F3C0.jpg'
      /// (OS Error: No such file or directory, errno = 2)
      // final Directory directory = (await getDownloadsDirectory())!;

      /// Unsupported operation: getExternalStoragePath is not supported on this platform,<…>
      // final Directory directory = (await getExternalStorageDirectory())!;

      /// This is not support on iOS.
      // final Directory directory =
      //     await getExternalStorageDirectories(type: StorageDirectory.downloads)
      //         .then((value) => value!.first);

      // Create a new path in the app's directory
      final String newPath =
          '${directory.path}/${DateTime.now().toIso8601String()}.jpg';

      mLogger.d('MUtilPickerImage::saveImage::newPath::$newPath');

      // Copy the image file to the new path
      final File newImageFile = await imageFile.copy(newPath);

      // Return the new image path
      return newImageFile.path;
    } catch (e, s) {
      mLogger.e('saveImage::error::$e,\n', stackTrace: s, error: e);
      mShowCustomToast('Failed to save image, please check the permission'.tr);
      return null;
    }
  }

  static Future<String?> pickImage(ImageSource imageSource) async {
    final PermissionStatus? status = imageSource == ImageSource.gallery
        ? await _requestPermissionsPhoto()
        : await requestPermissionsCamera();

    if (status?.isGranted ?? false) {
      try {
        final ImagePicker picker = ImagePicker();
        final XFile? image = await picker.pickImage(source: imageSource);
        if (image != null) {
          // Store the image path in the state
          return image.path;
        } else {
          // User canceled the picker
        }
      } catch (e, s) {
        mLogger.e('pickImage::e::$e', stackTrace: s, error: e);
        unawaited(mDialogConfirm('Notice'.tr, MStr.picturePermission, () async {
          await openAppSettings();
        }, tag: MAppDialogKey.confirmPicturePermission));
      }
    } else {
      unawaited(mDialogConfirm('Notice'.tr, MStr.picturePermission, () async {
        await openAppSettings();
      }, tag: MAppDialogKey.confirmPicturePermission));
    }
    return null;
  }

  static Future<PermissionStatus?> _requestPermissionsPhoto() async {
    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo =
          await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt <= 32) {
        return Permission.storage.request();
      } else {
        return Permission.photos.request();
      }
    } else if (Platform.isIOS) {
      PermissionStatus? valueOfPhotos;
      PermissionStatus? valueOfStorage;
      try {
        valueOfPhotos = await Permission.photos.request();

        /// The storage permission we must get else that will be error in different ios version
        /// when pick a image and save to local.
        valueOfStorage = await Permission.storage.request();
      } catch (e, s) {
        mShowCustomToast('Try it again.'.tr);
        mLogger.d('Error::_requestPermissionsPhoto::$e',
            error: e, stackTrace: s);
      }
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

  /// The video call will be used it on started on April 17, 2024.
  static Future<PermissionStatus?> requestPermissionsCamera() async {
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

  /// Actually, just that Implement for video call.
  static Future<PermissionStatus?> requestPermissionsMicrophone() async {
    if (Platform.isAndroid) {
      return Permission.microphone.request();
    } else if (Platform.isIOS) {
      final PermissionStatus valueOfMicrophone =
          await Permission.microphone.request();
      mLogger.d('_requestPermissions::valueOfMicrophone::$valueOfMicrophone');

      return (valueOfMicrophone == PermissionStatus.granted) ||
              (valueOfMicrophone == PermissionStatus.limited) ||
              (valueOfMicrophone == PermissionStatus.provisional)
          ? PermissionStatus.granted
          : PermissionStatus.denied;
    } else {
      throw Exception('Unsupported platform');
    }
  }

  /// Warning: Please do not use `Completer`.
  ///
  ///
  /// We must use the back data way to get the result
  /// if you use the `Completer` will always waiting when not select picture and use system back event
  /// and it will be makes `ButtonController.to.run` error.
  static Future<String?> changeAvatar() async {
    return showModalBottomSheet(
      context: Get.context!,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: Text('Select from Gallery'.tr),
                onTap: () async {
                  // Logic to select image from gallery
                  final String? result = await pickImage(ImageSource.gallery);
                  Get.back(result: result);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera),
                title: Text('Open Camera'.tr),
                onTap: () async {
                  // Logic to open camera
                  final String? result = await pickImage(ImageSource.camera);
                  Get.back(result: result);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
