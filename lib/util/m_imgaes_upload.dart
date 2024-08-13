import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:get/get.dart';

import 'm_picker_image_util.dart';

class MImagesUploadClickUpload {
  MImagesUploadClickUpload();
}

class MImagesUpload extends StatefulWidget {
  final RxList<String> images;
  final VoidCallback? onAddImage;
  final bool single;

  /// example:
  /// ```
  /// MImagesUpload(
  //               images: state.images, clickUpload: state.clickUploadImage),

  ///
  // Rx<MImagesUploadClickUpload> clickUploadImage =
  //     MImagesUploadClickUpload().obs;
  /// ```
  ///
  /// When you want show the upload dialog.
  ///
  ///```
  /// if (state.images.isEmpty) {
  //       showCustomToast('Please select images.');
  //       state.clickUploadImage.value = MImagesUploadClickUpload();
  //       return;
  //     }
  /// ```
  final Rx<MImagesUploadClickUpload>? clickUpload;

  const MImagesUpload(
      {required this.images,
      this.onAddImage,
      this.single = false,
      this.clickUpload,
      super.key});

  @override
  State<MImagesUpload> createState() => _MImagesUploadState();
}

class _MImagesUploadState extends ModifierState<MImagesUpload> {
  @override
  void initState() {
    super.initState();
    if (widget.clickUpload != null) {
      everAndAutoClose(widget.clickUpload!, (callback) {
        addImage();
      });
    }
  }

  void addImage() {
    toSelectImage();
  }

  Future<void> toSelectImage() async {
    await MButtonController.to.run(() async {
      final String? result = await MPickerImageUtil.changeAvatar();
      if (result == null) {
        return;
      }
      if (widget.images.isNotEmpty && widget.single) {
        widget.images[0] = result;
      } else {
        widget.images.add(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 90.px + 9.px,
        child: GridView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 4.0.px,
            mainAxisSpacing: 4.0.px,
          ),
          itemCount: widget.images.length < 3
              ? widget.images.length + 1
              : widget.images.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == widget.images.length && widget.images.length < 3) {
              return MAddButton(
                modifier: MAddButtonModifier.styleSquareCorner().onClick(() {
                  widget.onAddImage ?? addImage();
                }),
              );
            } else {
              return MAddButton(
                modifier: MAddButtonModifier.styleSquareCorner()
                    .onClick(() {})
                    .clickClose(() {
                  widget.images.removeAt(index);
                }),
                value: widget.images[index].obs,
              );
            }
          },
        ),
      ),
    );
  }
}
