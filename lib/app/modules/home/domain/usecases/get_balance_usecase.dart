import 'package:demo_stonks/app/modules/home/domain/models/balance.dart';
import 'package:demo_stonks/app/modules/home/domain/repositories/home_repository.dart';

class GetBalanceUsecase {
  final HomeRepository repository;

  GetBalanceUsecase({this.repository});

  Balance call() => repository.getBalance();
}
