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
                final List<String> list =
                    watch(historicListModelProvider.state).when(
                  empty: () => [],
                  list: (expressions) => expressions.reversed.toList(),
                );
                return AnimatedList(
                  key: animatedListKey,
                  physics: ClampingScrollPhysics(),
                  reverse: true,
                  initialItemCount: list.length,
                  itemBuilder: (context, index, animation) {
                    return AlignTransition(
                      alignment: animation.drive(
                        AlignmentTween(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Padding(
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
                      ),
                    );
                  },
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
                  watch(displayProv.state).maybeWhen(
                    expression: (exp) => exp,
                    orElse: () => '',
                  ),
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
