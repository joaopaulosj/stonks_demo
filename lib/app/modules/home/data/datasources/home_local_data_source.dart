import 'dart:math';

import 'package:demo_stonks/app/modules/home/domain/models/balance.dart';
import 'package:demo_stonks/app/modules/home/domain/models/user.dart';

class HomeLocalDataSource {
  List<int> sessionValues = [];

  HomeLocalDataSource() {
    sessionValues = generateRandomValues();
  }

  User getUser() {
    return User(id: 8, name: 'Abel');
  }

  Balance getBalance() {
    return Balance(values: sessionValues);
  }

  List<int> generateRandomValues() {
    final list = <int>[];
    final first = (Random().nextInt(50) + 50) * 10000;
    list.add(first);

    var index = 1;
    while (index < 60) {
      final value = list[index - 1] + (Random().nextInt(70000) - 30000);
      list.add(value);
      index++;
    }

    return list;
  }
}
