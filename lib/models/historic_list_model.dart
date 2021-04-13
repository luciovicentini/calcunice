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

  void clearList() {
    state = const HistoricListState.empty();
  }
}
