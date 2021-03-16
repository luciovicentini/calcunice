import 'package:flutter/material.dart';

class DarkLightSwitchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = 130;
    final double switchButtonWidth = width / 2;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
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
          Positioned(
              left: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Dark',
                  style: TextStyle(color: Colors.white),
                ),
              )),
          Positioned(
            left: width - switchButtonWidth,
            width: switchButtonWidth,
            top: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(241, 241, 241, 1),
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text('Light'),
            ),
          ),
        ],
      ),
    );
  }
}
