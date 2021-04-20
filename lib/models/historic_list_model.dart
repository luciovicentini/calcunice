import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:calcunice/states/historic_list_state.dart';

class HistoricListModel extends StateNotifier<HistoricListState> {
  HistoricListModel() : super(const HistoricListState.empty());

  void addNewMathExpression(String newExpression) {
    state.when(
      empty: () => state = HistoricListState.list([newExpression]),
      list: (expressions) {
        expressions.add(newExpression);
        state = HistoricListState.list(expressions);
      },
    );
  }

  int getIndexOfExpression(String expression) => state.when(
        empty: () => -1,
        list: (expressions) => expressions.indexOf(expression),
      );

  void removeExpression(int index) {
    if (index > 0) {
      state = state.maybeWhen(
        list: (expressions) {
          expressions.removeAt(index);
          return HistoricListState.list([...expressions]);
        },
        orElse: () => const HistoricListState.empty(),
      );
    }
  }

  void clearList() {
    state = const HistoricListState.empty();
  }
}
