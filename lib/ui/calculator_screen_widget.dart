import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants.dart';
import '../providers.dart';

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
            child: Consumer(
              builder: (context, watch, child) {
                final list =
                    watch(historicCalculationsProvider).state.reversed.toList();
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Text(
                        list[index],
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
                  physics: ClampingScrollPhysics(),
                  reverse: true,
                );
              },
            ),
          ),
          SizedBox(height: 4),
          Expanded(
            flex: 3,
            child: Consumer(
              builder: (context, watch, child) {
                return Text(
                  watch(displayProvider.state),
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                    color: kLightResultScreenTextColor,
                  ),
                  maxLines: 1,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
