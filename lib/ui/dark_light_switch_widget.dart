import 'package:calcunice/ui/animated_switch_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:calcunice/providers.dart';

class DarkLightSwitchWidget extends HookWidget {
  // ignore: prefer_const_constructors_in_immutables
  DarkLightSwitchWidget({Key? key}) : super(key: key);

  static const width = 140.0;
  static const switchButtonWidth = width / 2;
  static const duration = Duration(milliseconds: 200);
  late final AnimationController _controller;

  void _handleDragUpdate(DragUpdateDetails details) {
    _controller.value += details.primaryDelta! / switchButtonWidth;
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_controller.isAnimating ||
        _controller.status == AnimationStatus.completed ||
        _controller.status == AnimationStatus.dismissed) {
      return;
    }

    final currentVelocity =
        details.velocity.pixelsPerSecond.dx / switchButtonWidth;
    if (_controller.value == 0 && currentVelocity == 0) {
      return;
    }

    const flingVelocity = 2.0;
    if (_controller.value > 0.5) {
      _controller.fling(velocity: flingVelocity);
    } else {
      _controller.fling(velocity: -flingVelocity);
    }
    if (currentVelocity.abs() > flingVelocity.abs()) {
      if (currentVelocity > 0) {
        _controller.fling(velocity: flingVelocity);
      } else {
        _controller.fling(velocity: -flingVelocity);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final _isLight = useProvider(isLightProvider).state;
    _controller = _getAnimationController(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: GestureDetector(
        onTap: () {
          _isLight ? _controller.reverse() : _controller.forward();
        },
        onHorizontalDragUpdate: _handleDragUpdate,
        onHorizontalDragEnd: _handleDragEnd,
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
                animation: _controller,
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

  AnimationController _getAnimationController(BuildContext context) =>
      useAnimationController(duration: duration, initialValue: 1)
        ..addStatusListener((status) {
          if (_controller.value == 0) {
            updateLightState(context, isLight: false);
          }
          if (_controller.value == 1) {
            updateLightState(context, isLight: true);
          }
        });

  void updateLightState(BuildContext context, {required bool isLight}) {
    context.read(isLightProvider).state = isLight;
  }
}
