import 'dart:math';

import 'package:flutter/foundation.dart';

class Balance {
  final List<int> values;
  final double initialValue = Random().nextInt(1000000) + 500000.0;

  Balance({@required this.values});

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

  double get todayPercent => todayValues.last / todayValues.first - 1;

  double get totalPercent => values.last / values.first - 1;

  double get totalValue => totalPercent * initialValue;

  double get buyingPower => totalValue * 0.3;

  double get balance => initialValue + totalValue;
}
