import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:get/get.dart';

class MImagesUpload extends StatelessWidget {
  final RxList<String> images;
  final VoidCallback? onAddImage;

  const MImagesUpload({required this.images, this.onAddImage, super.key});

  void addImage() {
    images.add('https://via.placeholder.com/150');
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
