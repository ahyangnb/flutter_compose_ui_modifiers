import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/util/log.dart';

import '../m/m_stack.dart';

class MWaterRipplesContainer extends StatelessWidget {
  const MWaterRipplesContainer({
    required this.child,
    required this.size,
    this.color,
    super.key,
  });

  final Widget child;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return MStack(
      modifier: MStackModifier.centerAlignStack(),
      children: <Widget>[
        SizedBox(
          width: size,
          height: size,
          child: WaterRipples(
            color: color,
            size: size,
          ),
        ),
        child
      ],
    );
  }
}

class WaterRipples extends StatefulWidget {
  const WaterRipples({required this.color, required this.size, super.key});

  final double size;
  final Color? color;

  @override
  State<StatefulWidget> createState() => _WaterRipplesState();
}

class _WaterRipplesState extends State<WaterRipples>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  //animation controller
  final List<AnimationController> _controllers = <AnimationController>[];

  //Animation control collection
  final List<Widget> _children = <Widget>[];

  //Add bluetooth retrieval animation timer
  Timer? _searchBluetoothTimer;

  Color get useColor => widget.color ?? Colors.red.withOpacity(0.5);

  double get beginUse => 0;

  double get end => widget.size * 1.5;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: _children,
    );
  }

  ///Initialize the Bluetooth retrieval animation, and add 5 zoom animations in sequence to form a water ripple animation effect.
  void _startAnimation() {
    //Before starting the animation, ensure that the total number of _children controls is 0
    _children.clear();
    int count = 0;
    //Add the first circular zoom animation
    _addSearchAnimation(true);
    //After that, every 1 second, add a zoom animation again, adding a total of 4
    _searchBluetoothTimer =
        Timer.periodic(const Duration(milliseconds: 1000), (Timer timer) {
          if (!mounted) {
            timer.cancel();
            return;
          }
          _addSearchAnimation(true);
          count++;
          if (count >= 4) {
            timer.cancel();
          }
        });
  }

  ///Add Bluetooth retrieval animation control
  ///init: When adding 5 basic controls for the first time, =true,
  void _addSearchAnimation(bool init) {
    final AnimationController controller = _createController();
    _controllers.add(controller);
    final Animation<double> animation = Tween<double>(begin: beginUse, end: end)
        .animate(CurvedAnimation(parent: controller, curve: Curves.linear));
    if (!init) {
      //After the initialization of the 5 basic animation controls is completed, every time a new animation control is added,
      // remove the first one to ensure that there are always 5 animation controls.
      _children.removeAt(0);
      //Add new animation controls
      Future<void>.delayed(const Duration(seconds: 1), () {
        if (!mounted) {
          return;
        }
        //If the animation page exits without execution, continue adding animations.
        _children.add(AnimatedBuilder(
            animation: controller,
            builder: (BuildContext context, Widget? child) {
              return Opacity(
                // opacity: (300.0 - animation.value) / 300.0,
                opacity:
                1.0 - ((animation.value - beginUse) / (end - beginUse)),
                child: ClipOval(
                  child: Container(
                    width: animation.value,
                    height: animation.value,
                    color: useColor,
                  ),
                ),
              );
            }));
        try {
          //When the animation page exits, capture the exception that may occur
          controller.forward();
          setState(() {});
        } catch (e) {
          return;
        }
      });
    } else {
      _children.add(AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget? child) {
            return Opacity(
              opacity: 1.0 - ((animation.value - beginUse) / (end - beginUse)),
              child: ClipOval(
                child: Container(
                  width: animation.value,
                  height: animation.value,
                  color: useColor,
                ),
              ),
            );
          }));
      controller.forward();
      setState(() {});
    }
  }

  ///Create a Bluetooth retrieval animation controller
  AnimationController _createController() {
    final AnimationController controller = AnimationController(
        duration: const Duration(milliseconds: 4000), vsync: this);
    controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
        if (_controllers.contains(controller)) {
          _controllers.remove(controller);
        }
        //Each time the animated control ends, add a new control to maintain the continuity of the animation
        if (mounted) {
          _addSearchAnimation(false);
        }
      }
    });
    return controller;
  }

  ///Monitor application status,
  /// Callback when life cycle changes
  /// resumed: The application is visible and can respond to user operations
  /// inactive: visible to the user, but cannot respond to user operations
  /// paused: has been paused, invisible and inoperable to the user
  /// suspending: The application is suspended, IOS will never call back in this state
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      //The application retreats to the background and destroys the Bluetooth retrieval animation.
      _disposeSearchAnimation();
    } else if (state == AppLifecycleState.resumed) {
      //The app returns to the foreground and restarts the animation
      _startAnimation();
    }
  }

  ///destroy animation
  void _disposeSearchAnimation() {
    //Release all controllers of animation
    for (final AnimationController element in _controllers) {
      element.dispose();
    }
    _controllers.clear();
    _searchBluetoothTimer?.cancel();
    _children.clear();
  }

  @override
  void initState() {
    super.initState();
    _startAnimation();
    //Add application life cycle monitoring
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    mLogger.d(
        'tag--video_preview_page=========================dispose===================');
    //destroy animation
    _disposeSearchAnimation();
    //Destroy application lifecycle observers
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
