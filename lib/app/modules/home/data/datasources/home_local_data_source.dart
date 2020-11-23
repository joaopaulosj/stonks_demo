import 'dart:math';

import 'package:demo_stonks/app/modules/home/domain/models/balance.dart';
import 'package:demo_stonks/app/modules/home/domain/models/company.dart';
import 'package:demo_stonks/app/modules/home/domain/models/message.dart';
import 'package:demo_stonks/app/modules/home/domain/models/portfolio.dart';
import 'package:demo_stonks/app/modules/home/domain/models/user.dart';

class HomeLocalDataSource {
  User getUser() {
    return User(id: 8, name: 'Abel');
  }

  Balance getBalance() {
    return Balance(values: _generateRandomValues(100));
  }

  List<Portfolio> getPortfolio() {
    return _getCompanies().map((company) {
      return Portfolio(
        company: company,
        values: _generateRandomValues(10),
        messages: [
          Message(text: 'First'),
          Message(
            text:
                'Lorem ipsum dolor sit amet consectetur dolor sit amet aldo aks dos as',
          ),
        ],
      );
    }).toList();
  }

  List<Company> _getCompanies() {
    return [
      Company(id: 1, logo: 'assets/logos/logo_paypal.png', name: 'PayPal'),
      Company(id: 2, logo: 'assets/logos/logo_twitter.png', name: 'Twitter'),
      Company(id: 3, logo: 'assets/logos/logo_tesla.png', name: 'Tesla'),
      Company(id: 4, logo: 'assets/logos/logo_facebook.png', name: 'Facebook'),
    ];
  }

  List<int> _generateRandomValues(int count) {
    final list = <int>[];
    final first = (Random().nextInt(50) + 50) * 10000;
    list.add(first);

    var index = 1;
    while (index < count) {
      final value = list[index - 1] + (Random().nextInt(70000) - 30000);
      list.add(value);
      index++;
    }

    return list;
  }
}
