import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers.dart';

class DarkLightSwitchWidget extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final double width = 130;
    final double switchButtonWidth = width / 2;
    final duration = Duration(milliseconds: 200);
    final isLight = useProvider(isLightProvider).state;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: GestureDetector(
        onTap: () {
          context.read(isLightProvider).state = !isLight;
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: width,
              decoration: BoxDecoration(
                color: Color.fromRGBO(120, 120, 120, 1),
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
            AnimatedPositioned(
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(241, 241, 241, 1),
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              left: isLight ? width - switchButtonWidth : 0,
              width: switchButtonWidth,
              top: 0,
              bottom: 0,
              duration: duration,
            ),
            Positioned(
              left: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: AnimatedDefaultTextStyle(
                  child: Text('Dark'),
                  style: isLight
                      ? TextStyle(color: Colors.white)
                      : TextStyle(color: Colors.black),
                  duration: duration,
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: AnimatedDefaultTextStyle(
                  child: Text('Light'),
                  style: isLight
                      ? TextStyle(color: Colors.black)
                      : TextStyle(color: Colors.white),
                  duration: duration,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
