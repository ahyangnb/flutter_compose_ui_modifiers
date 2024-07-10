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

/// Use example:
/// ```
/// MAnimateFadeContent(
// /// You can change the visible and refresh the ui state.
//    visible: visible,
//    child: Text("HI I am a Widget"),
//  );
/// ```
class MAnimateFadeContent extends StatelessWidget {
  final bool visible;
  final Widget child;
  final bool containReverse;
  final int? milliseconds;

  const MAnimateFadeContent({
    required this.visible,
    required this.child,
    this.containReverse = true,
    this.milliseconds,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final millisecondsUse = milliseconds ?? 300;
    return AnimatedCrossFade(
      firstChild: Container(),
      secondChild: child,
      crossFadeState:
          visible ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: Duration(milliseconds: millisecondsUse),
      reverseDuration:
          Duration(milliseconds: containReverse ? millisecondsUse : 0),
    );
  }
}

/// Use example:
/// ```
/// MAnimateLeftToRight(
// /// You can change the visible and refresh the ui state.
//    visible: visible,
//    child: Text("HI I am a Widget"),
//  );
/// ```
class MAnimateLeftToRight extends StatefulWidget {
  final bool visible;
  final Widget child;
  final bool containReverse;

  const MAnimateLeftToRight({
    required this.visible,
    required this.child,
    this.containReverse = true,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => MAnimateLeftToRightState();
}

class MAnimateLeftToRightState extends State<MAnimateLeftToRight>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<Offset>? _animation;
  Animation<double>? _animationOpacity;

  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0))
        .animate(_controller!);
    _animationOpacity =
        Tween<double>(begin: 0.0, end: 1.0).animate(_controller!);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant MAnimateLeftToRight oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.visible != oldWidget.visible) {
      if (widget.visible) {
        _controller!.forward();
      } else {
        _controller!.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller!,
      builder: (BuildContext context, Widget? child) {
        if (_animationOpacity!.value == 0) return Container();
        return FadeTransition(
          opacity: _animationOpacity!,
          child: SlideTransition(
            position: _animation!,
            child: widget.child,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}

/// Use example:
/// ```
/// MAnimateFadeShow(
// /// You can change the visible and refresh the ui state.
//    secondVisible: visible,
//    firstChild: Text("Loading"),
//    secondChild: Text("HI I am a Widget"),
//  );
/// ```
class MAnimateFadeShow extends StatelessWidget {
  final bool secondVisible;
  final Widget secondChild;
  final Widget firstChild;
  final int? milliseconds;

  MAnimateFadeShow({
    required this.secondVisible,
    required this.secondChild,
    required this.firstChild,
    this.milliseconds,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: firstChild,
      secondChild: secondChild,
      crossFadeState:
          secondVisible ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: Duration(milliseconds: milliseconds ?? 300),
    );
  }
}

class MAnimatedSwitcher {
  static Widget scaleWithOpacity(Widget child, Animation<double> animation) {
    return FadeTransition(
      key: ValueKey<Key?>(child.key),
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}
