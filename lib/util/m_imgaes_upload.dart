import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:get/get.dart';

import 'm_picker_image_util.dart';

class MImagesUpload extends StatelessWidget {
  final RxList<String> images;
  final VoidCallback? onAddImage;
  final bool single;

  const MImagesUpload(
      {required this.images, this.onAddImage, this.single = false, super.key});

  void addImage() {}

  Future<void> toSelectImage() async {
    await MButtonController.to.run(() async {
      final String? result = await MPickerImageUtil.changeAvatar();
      if (result == null) {
        return;
      }
      if (images.isNotEmpty && single) {
        images[0] = result;
      } else {
        images.add(result);
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
          itemCount: images.length < 3 ? images.length + 1 : images.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == images.length && images.length < 3) {
              return MAddButton(
                modifier: MAddButtonModifier.styleSquareCorner().onClick(() {
                  onAddImage ?? addImage();
                }),
              );
            } else {
              return MAddButton(
                modifier: MAddButtonModifier.styleSquareCorner()
                    .onClick(() {})
                    .clickClose(() {
                  images.removeAt(index);
                }),
                value: images[index].obs,
              );
            }
          },
        ),
      ),
    );
  }
}
