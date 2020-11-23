import 'package:demo_stonks/app/base/app_states.dart';
import 'package:demo_stonks/app/modules/home/domain/models/balance.dart';
import 'package:demo_stonks/app/modules/home/domain/models/portfolio.dart';
import 'package:demo_stonks/app/modules/home/domain/models/user.dart';
import 'package:demo_stonks/app/modules/home/domain/usecases/get_balance_usecase.dart';
import 'package:demo_stonks/app/modules/home/domain/usecases/get_portfolio_usecase.dart';
import 'package:demo_stonks/app/modules/home/domain/usecases/get_user_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final GetBalanceUsecase getBalanceUsecase;
  final GetUserUsecase getUserUsecase;
  final GetPortfolioUsecase getPortfolioUsecase;

  _HomeControllerBase({
    @required this.getBalanceUsecase,
    @required this.getUserUsecase,
    @required this.getPortfolioUsecase,
  });

  @observable
  UIState balanceState = InitialState();

  @observable
  UIState userState = InitialState();

  @observable
  UIState chartState = InitialState();

  void onInit() {
    _loadBalance();
    _loadUser();
    _loadChart();
  }

  void _loadBalance() {
    final balance = getBalanceUsecase();
    balanceState = BalanceState(balance);
  }

  void _loadUser() {
    final user = getUserUsecase();
    userState = UserState(user);
  }

  void _loadChart() {
    final state = balanceState;
    if (state is BalanceState) {
      chartState = ChartState(
        type: ChartType.all,
        values: state.balance.getValuesFromType(ChartType.all),
      );
    } else {
      chartState = ChartState(type: ChartType.day, values: []);
    }
  }

  void onChartTypeClicked(ChartType type) {
    chartState = ChartState(
      type: type,
      values: (balanceState as BalanceState).balance.getValuesFromType(type),
    );
  }

  List<Portfolio> get getPortfolio => getPortfolioUsecase();
}

class BalanceState implements UIState {
  final Balance balance;

  BalanceState(this.balance);
}

class UserState implements UIState {
  final User user;

  UserState(this.user);
}

class ChartState implements UIState {
  final List<int> values;
  final ChartType type;

  ChartState({@required this.type, @required this.values});
}

enum ChartType { day, week, month, threeMonths, year, all }
