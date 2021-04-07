import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../states/historic_list_state.dart';

class HistoricListModel extends StateNotifier<HistoricListState> {
  HistoricListModel() : super(HistoricListState.empty());

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
    state = HistoricListState.empty();
  }
}
