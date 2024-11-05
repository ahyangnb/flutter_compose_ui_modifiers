import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

Future<void>? mShowBigPicture(String? url, {final Object? heroTag}) async {
  if (url!.isEmpty) {
    myToast("The picture url is empty.");
    return;
  }
  return Get.to<void>(MBigPicPage(url, heroTag));
}

class MBigPicPage extends StatelessWidget {
  final String url;
  final Object? heroTag;

  MBigPicPage(this.url, this.heroTag);

  @override
  Widget build(BuildContext context) {
    final img = PhotoView(
      imageProvider: mGetImageProvider(url),
      initialScale: PhotoViewComputedScale.contained,
      heroAttributes: PhotoViewHeroAttributes(tag: url),
      minScale: 0.3,
      maxScale: 5.0,
      onTapUp: (BuildContext context, TapUpDetails details,
              PhotoViewControllerValue controllerValue) =>
          Get.back(),
      loadingBuilder: (BuildContext context, ImageChunkEvent? event) => Center(
        child: SizedBox(
          width: 20.0,
          height: 20.0,
          child: CircularProgressIndicator(
            value: event == null
                ? 0
                : event.cumulativeBytesLoaded / (event.expectedTotalBytes ?? 0),
          ),
        ),
      ),
    );
    return Stack(
      children: [
        AppBar(systemOverlayStyle: SystemUiOverlayStyle.light),
        Scaffold(
          backgroundColor: Colors.black,
          // systemUiOverlayStyle: SystemUiOverlayStyle.light,
          body: Stack(
            children: <Widget>[
              if (heroTag != null) Hero(tag: heroTag!, child: img) else img,
              Positioned(
                left: 0.px,
                top: 0.px,
                child: InkWell(
                  child: SafeArea(
                    bottom: false,
                    child: Container(
                      height: kToolbarHeight,
                      alignment: Alignment.center,
                      child: const MBlockBackButton(color: Colors.white),
                    ),
                  ),
                  onTap: () {
                    Get.back();
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MBlockBackButton extends StatelessWidget {
  const MBlockBackButton({this.color, super.key});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.5.px, vertical: 9.5),
      child: InkWell(
        onTap: () {
          Get.back();
        },
        child: Icon(
          Icons.arrow_back_ios_outlined,
          color: color,
        ),
      ),
    );
  }
}
