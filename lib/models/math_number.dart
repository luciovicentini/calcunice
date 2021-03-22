import 'package:calcunice/models/resultable.dart';

class MathNumber with Resultable {
  const MathNumber(this.number);
  final double number;

  @override
  double getResult() => number;

  Map<String, dynamic> toJson() => {'number': number};
}
