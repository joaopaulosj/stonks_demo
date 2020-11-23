import 'dart:math';

import 'package:demo_stonks/app/modules/home/ui/controllers/home_controller.dart';
import 'package:flutter/foundation.dart';

class Balance {
  final List<int> values;

  Balance({@required this.values});

  List<int> getValuesFromType(ChartType type) {
    switch (type) {
      case ChartType.day:
        return _todayValues;
      case ChartType.week:
        return _weekValues;
      case ChartType.month:
        return _monthValues;
      case ChartType.threeMonths:
        return _threeMonthsValues;
      case ChartType.year:
        return _yearValues;
      default:
        return values;
    }
  }

  List<int> get _todayValues =>
      values.sublist((values.length * 0.9).round(), values.length);

  List<int> get _weekValues =>
      values.sublist((values.length * 0.8).round(), values.length);

  List<int> get _monthValues =>
      values.sublist((values.length * 0.6).round(), values.length);

  List<int> get _threeMonthsValues =>
      values.sublist((values.length * 0.4).round(), values.length);

  List<int> get _yearValues =>
      values.sublist((values.length * 0.2).round(), values.length);

  double get todayPercent => (_todayValues.last / _todayValues.first - 1) * 100;

  double get totalPercent => (values.last / values.first - 1) * 100;

  double get totalValueDiff => (values.last - values.first).toDouble();

  double get buyingPower => (value * 0.3).abs();

  double get value => values.first + totalValueDiff + Random().nextDouble();
}
