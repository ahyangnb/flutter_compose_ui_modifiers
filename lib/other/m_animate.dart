import 'package:flutter/material.dart';

class MAnimateScale extends StatelessWidget {
  final Widget child;

  const MAnimateScale({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(
          key: ValueKey<Key?>(child.key),
          scale: animation,
          child: child,
        );
      },
      child: child,
    );
  }
}
