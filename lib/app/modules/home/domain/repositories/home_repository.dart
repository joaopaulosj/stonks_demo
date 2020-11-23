import 'package:demo_stonks/app/modules/home/domain/models/balance.dart';
import 'package:demo_stonks/app/modules/home/domain/models/portfolio.dart';
import 'package:demo_stonks/app/modules/home/domain/models/user.dart';

abstract class HomeRepository {
  Balance getBalance();
  User getUser();
  List<Portfolio> getPortfolio();
}
