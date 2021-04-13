import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:calcunice/providers.dart';

class DarkLightSwitchWidget extends HookWidget {
  const DarkLightSwitchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const width = 130.0;
    const switchButtonWidth = width / 2;
    const duration = Duration(milliseconds: 200);
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
                color: const Color.fromRGBO(120, 120, 120, 1),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            AnimatedPositioned(
              left: isLight ? width - switchButtonWidth : 0,
              width: switchButtonWidth,
              top: 0,
              bottom: 0,
              duration: duration,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(241, 241, 241, 1),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            Positioned(
              left: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: AnimatedDefaultTextStyle(
                  style: isLight
                      ? const TextStyle(color: Colors.white)
                      : const TextStyle(color: Colors.black),
                  duration: duration,
                  child: const Text('Dark'),
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: AnimatedDefaultTextStyle(
                  style: isLight
                      ? const TextStyle(color: Colors.black)
                      : const TextStyle(color: Colors.white),
                  duration: duration,
                  child: const Text('Light'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
