import 'package:flutter/foundation.dart';

class Balance {
  final List<int> values;

  Balance({@required this.values}) {
    print('initial: ${values.first}');
    print('final: ${values.last}');
  }

  List<int> get todayValues =>
      values.sublist((values.length * 0.9).round(), values.length);

  List<int> get weekValues =>
      values.sublist((values.length * 0.8).round(), values.length);

  List<int> get monthValues =>
      values.sublist((values.length * 0.6).round(), values.length);

  List<int> get threeMonthsValues =>
      values.sublist((values.length * 0.4).round(), values.length);

  List<int> get yearValues =>
      values.sublist((values.length * 0.2).round(), values.length);

  double get todayPercent => (todayValues.last / todayValues.first - 1) * 100;

  double get totalPercent => (values.last / values.first - 1) * 100;

  double get totalValueDiff => (values.last - values.first).toDouble();

  double get buyingPower => totalValueDiff * 0.3;

  double get value => values.first + totalValueDiff;
}
