import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/config/m_color.dart';
import 'package:flutter_compose_ui_modifiers/config/m_theme_config.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:get/get.dart';

class MNoData extends StatefulWidget {
  final Future<void> Function()? onPressed;
  final String? noDataText;
  final double? topSpace;
  final Widget? noDataImage;

  const MNoData(
    this.onPressed, {
    this.noDataText,
    this.noDataImage,
    this.topSpace,
    super.key,
  });

  @override
  State<MNoData> createState() => _MNoDataState();
}

class _MNoDataState extends State<MNoData> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: widget.topSpace ?? 134.px),
          widget.noDataImage ??
              MConfig.defNoDataImage ??
              Icon(CupertinoIcons.news, size: 100.px, color: Colors.white),
          SizedBox(height: 15.px),
          Text(
            widget.noDataText ?? MConfig.noDataText,
            style: TextStyle(
              fontSize: 33.px,
              color: MColor.noDataTextColor,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.px),

          /// Add loading to the button no any sense, because will not display button when page reloading.
          ///
          /// But error will be use the loading.
          if (widget.onPressed != null)
            Obx(
              () {
                if (MConfig.isChildDataLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                final double height = 44.px;
                return MButton(
                  text: MConfig.refreshText,
                  width: 127.px,
                  height: height,
                  borderRadius: BorderRadius.all(Radius.circular(height / 2)),
                  onTap: () async {
                    try {
                      MConfig.isChildDataLoading.value = true;
                      await widget.onPressed!();
                    } finally {
                      MConfig.isChildDataLoading.value = false;
                    }
                  },
                );
              },
            ),
        ],
      ),
    );
  }
}

class MErrorData extends StatelessWidget {
  final Future<void> Function()? onPressed;

  final double? topSpace;

  const MErrorData(this.onPressed, {this.topSpace, super.key});

  @override
  Widget build(BuildContext context) {
    return MNoData(onPressed, noDataText: "Error", topSpace: topSpace);
  }
}
