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
    /*final controller = useAnimationController(duration: duration);
    final colorTween =
        ColorTween(begin: Colors.white, end: Colors.black).animate(controller); */

    final isLight = useProvider(isLightProvider).state;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: GestureDetector(
        onTap: () {
          final isLight = context.read(isLightProvider).state;
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
                child: Text(
                  'Dark',
                  style: TextStyle(
                    color: isLight ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text(
                  'Light',
                  style: TextStyle(
                    color: isLight ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
