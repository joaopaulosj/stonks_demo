import 'dart:math';

import 'package:demo_stonks/app/modules/home/domain/models/balance.dart';

class HomeLocalDataSource {
  List<int> sessionValues = [];

  HomeLocalDataSource() {
    sessionValues = generateRandomValues();
  }

  Balance getBalance() {
    return Balance(values: sessionValues);
  }

  List<int> generateRandomValues() {
    final list = <int>[];
    list.add(Random().nextInt(50) + 50);

    var index = 1;
    while (index < 60) {
      final value = list[index - 1] + (Random().nextInt(15) - 7);
      list.add(value);
      index++;
    }

    return list;
  }
}
