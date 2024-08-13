import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MDragOut extends StatefulWidget {
  final double height;
  final Widget child;
  final VoidCallback onDismiss;

  const MDragOut(
      {required this.height,
      required this.child,
      required this.onDismiss,
      super.key});

  @override
  State<MDragOut> createState() => _MDragOutState();
}

class _MDragOutState extends State<MDragOut> {
  RxDouble y = 0.0.obs;

  @override
  Widget build(BuildContext context) {
    return Draggable(
      feedback: Container(),
      affinity: Axis.vertical,
      onDragUpdate: (v) {
        y.value += v.delta.dy;
      },
      onDragEnd: (DraggableDetails details) {
        if (y.value < -(widget.height / 2)) {
          y.value = -widget.height;
          widget.onDismiss();
        } else {
          y.value = 0;
        }
      },
      child: Stack(
        children: [
          SizedBox(height: widget.height, width: Get.width),
          Obx(
            () => Transform.translate(
              offset: Offset(0, y.value),
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }
}
