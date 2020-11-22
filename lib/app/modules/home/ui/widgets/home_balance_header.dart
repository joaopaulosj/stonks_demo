import 'package:demo_stonks/app/base/app_dimens.dart';
import 'package:demo_stonks/app/base/app_strings.dart';
import 'package:demo_stonks/app/modules/home/ui/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class HomeBalanceHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<HomeController>();
    final formatCurrency = NumberFormat.simpleCurrency(decimalDigits: 0);

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(kMarginDefault),
        child: Observer(
          builder: (context) {
            final state = controller.balanceState;
            if (state is BalanceState) {
              return Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.homeTodayTitle,
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          _ArrowIcon(value: state.balance.todayPercent),
                          SizedBox(width: 4.0),
                          _PercentText(value: state.balance.todayPercent),
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.homeTotalPercentTitle,
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          _ArrowIcon(value: state.balance.totalPercent),
                          SizedBox(width: 4.0),
                          _PercentText(value: state.balance.totalPercent),
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.homeTotalValueTitle,
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '${formatCurrency.format(state.balance.totalValue.floor())}',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Spacer(flex: 2),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}

class _PercentText extends StatelessWidget {
  const _PercentText({
    Key key,
    @required this.value,
  }) : super(key: key);

  final double value;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${value.toStringAsFixed(2)}%',
      style: TextStyle(
        color: value > 0 ? Colors.green : Colors.red,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _ArrowIcon extends StatelessWidget {
  const _ArrowIcon({
    Key key,
    @required this.value,
  }) : super(key: key);

  final double value;

  @override
  Widget build(BuildContext context) {
    return Icon(
      value > 0 ? Icons.arrow_upward : Icons.arrow_downward,
      size: 20.0,
      color: value > 0 ? Colors.green : Colors.red,
    );
  }
}
