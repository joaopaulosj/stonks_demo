import 'dart:math';

import 'package:demo_stonks/app/modules/home/domain/models/company.dart';
import 'package:flutter/foundation.dart';

import 'message.dart';

class Portfolio {
  final Company company;
  final List<int> values;
  final List<Message> messages;
  final int unreadCount;
  int membersCount;
  double balance;

  Portfolio({
    @required this.company,
    @required this.values,
    @required this.messages,
    @required this.unreadCount,
  }) {
    balance = (Random().nextInt(900) + 100) + Random().nextDouble();
    membersCount = Random().nextInt(1000);
  }

  double get percent => ((values.last / values.first - 1) * 100);
}
