import 'package:flutter/material.dart';

import '../constants.dart';

class CalculatorScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 9,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: Text(
                    index % 2 == 0 ? '20 x 5' : '10 + 5 x 2',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: kLightResultScreenTextColor.withOpacity(0.8),
                      wordSpacing: 8.0,
                    ),
                    maxLines: 1,
                  ),
                );
              },
              physics: BouncingScrollPhysics(),
              reverse: true,
            ),
          ),
          SizedBox(height: 4),
          Expanded(
              flex: 3,
              child: Text(
                '= 100',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: kLightResultScreenTextColor,
                ),
                maxLines: 1,
              ))
        ],
      ),
    );
  }
}
