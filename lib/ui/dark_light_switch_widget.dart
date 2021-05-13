import 'package:calcunice/ui/animated_switch_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:calcunice/providers.dart';

class DarkLightSwitchWidget extends HookWidget {
  const DarkLightSwitchWidget({Key? key}) : super(key: key);

  static const width = 140.0;
  static const switchButtonWidth = width / 2;
  static const duration = Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    final _isLight = useProvider(isLightProvider).state;
    final controller = _getAnimationController(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: GestureDetector(
        onTap: () {
          _isLight ? controller.reverse() : controller.forward();
        },
        onHorizontalDragUpdate: (details) {
          _handleDragUpdate(details, controller);
        },
        onHorizontalDragEnd: (details) {
          _handleDragEnd(details, controller);
        },
        child: Container(
          width: width,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(120, 120, 120, 1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedSwitch(
                animation: controller,
                width: switchButtonWidth,
              ),
              Positioned(
                left: switchButtonWidth / 2 - 15,
                child: AnimatedDefaultTextStyle(
                  style: _isLight
                      ? const TextStyle(color: Colors.white)
                      : const TextStyle(color: Colors.black),
                  duration: duration,
                  child: const Text('Dark'),
                ),
              ),
              Positioned(
                right: switchButtonWidth / 2 - 15,
                child: AnimatedDefaultTextStyle(
                  style: _isLight
                      ? const TextStyle(color: Colors.black)
                      : const TextStyle(color: Colors.white),
                  duration: duration,
                  child: const Text('Light'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleDragUpdate(
      DragUpdateDetails details, AnimationController controller) {
    controller.value += details.primaryDelta! / switchButtonWidth;
  }

  void _updateStatueListener(
      BuildContext context, AnimationController controller) {
    if (controller.value == 0) {
      updateLightState(context, isLight: false);
    }
    if (controller.value == 1) {
      updateLightState(context, isLight: true);
    }
  }

  void _handleDragEnd(DragEndDetails details, AnimationController controller) {
    if (controller.isAnimating ||
        controller.status == AnimationStatus.completed ||
        controller.status == AnimationStatus.dismissed) {
      return;
    }

    final currentVelocity =
        details.velocity.pixelsPerSecond.dx / switchButtonWidth;
    if (controller.value == 0 && currentVelocity == 0) {
      return;
    }

    const flingVelocity = 2.0;
    if (controller.value > 0.5) {
      controller.fling(velocity: flingVelocity);
    } else {
      controller.fling(velocity: -flingVelocity);
    }
    if (currentVelocity.abs() > flingVelocity.abs()) {
      if (currentVelocity > 0) {
        controller.fling(velocity: flingVelocity);
      } else {
        controller.fling(velocity: -flingVelocity);
      }
    }
  }

  AnimationController _getAnimationController(BuildContext context) {
    final controller =
        useAnimationController(duration: duration, initialValue: 1);

    controller.addStatusListener((_) {
      _updateStatueListener(context, controller);
    });

    return controller;
  }

  void updateLightState(BuildContext context, {required bool isLight}) {
    context.read(isLightProvider).state = isLight;
  }
}
