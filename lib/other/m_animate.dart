import 'package:flutter/material.dart';

/// You must set key to child.
///
/// Example:
/// ```dart
/// MAnimateScale(
//   child: Text(
//     text,
//     key: ValueKey(text),
//   ),
// )
/// ```
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

class MFadeContent extends StatelessWidget {
  final bool visible;
  final Widget child;

  const MFadeContent({required this.visible, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: Container(),
      secondChild: child,
      crossFadeState:
          visible ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 300),
    );
  }
}

class MFadeShow extends StatelessWidget {
  final bool secondVisible;
  final Widget secondChild;
  final Widget firstChild;

  MFadeShow({
    required this.secondVisible,
    required this.secondChild,
    required this.firstChild,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: firstChild,
      secondChild: secondChild,
      crossFadeState:
          secondVisible ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 300),
    );
  }
}
