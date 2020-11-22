import 'package:demo_stonks/app/base/app_states.dart';
import 'package:demo_stonks/app/modules/home/domain/models/balance.dart';
import 'package:demo_stonks/app/modules/home/domain/usecases/get_balance_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final GetBalanceUsecase getBalanceUsecase;

  _HomeControllerBase({@required this.getBalanceUsecase});

  @observable
  UIState balanceState = InitialState();

  void onInit() {
    _loadBalance();
  }

  void _loadBalance() {
    final balance = getBalanceUsecase();
    balanceState = BalanceState(balance);
  }
}

class BalanceState implements UIState {
  final Balance balance;

  BalanceState(this.balance);
}
