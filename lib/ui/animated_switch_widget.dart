import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AnimatedSwitch extends StatelessWidget {
  const AnimatedSwitch({required this.animation, required this.width, Key? key})
      : super(key: key);

  final Animation<double> animation;
  final double width;

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
      animation: animation,
      builder: (context, build) => Positioned(
            left: animation.value * width,
            top: 0,
            bottom: 0,
            child: Container(
              width: width,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(241, 241, 241, 1),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ));

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<Animation<double>>('animation', animation));
    properties.add(DoubleProperty('width', width));
  }
}
