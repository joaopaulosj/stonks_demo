import 'dart:math';

import 'package:demo_stonks/app/modules/home/domain/models/balance.dart';
import 'package:demo_stonks/app/modules/home/domain/models/company.dart';
import 'package:demo_stonks/app/modules/home/domain/models/message.dart';
import 'package:demo_stonks/app/modules/home/domain/models/portfolio.dart';
import 'package:demo_stonks/app/modules/home/domain/models/post.dart';
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

  List<Post> getTopPosts() {
    return [
      Post(
        user: _getUsers()[Random().nextInt(_getUsers().length)],
        hour: '2:18 PM',
        text:
            '''Tech stocks up 5% holy moly *&ˆ*&ˆ*&ˆ. What a time to be alive. Who cares if its a bubble? Ride and roll baby! ⚡️⚡️⚡️''',
      ),
      Post(
        user: _getUsers()[Random().nextInt(_getUsers().length)],
        hour: '2:18 PM',
        text:
            '''The tech heavy Nasdaq under performed last week as we saw a rotation out of defensive tech stocks into shares more exposed to economic growth on the back of the vaccine news. "Work from home” stocks were under pressure but recovered towards the end of the week.''',
      ),
    ];
  }

  List<User> _getUsers() {
    return [
      User(id: 1, name: 'John Doe'),
      User(id: 2, name: 'Mary Ann'),
      User(id: 3, name: 'John Doe'),
      User(id: 4, name: 'John Doe'),
    ];
  }
}
